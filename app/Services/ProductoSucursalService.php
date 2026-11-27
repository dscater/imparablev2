<?php

namespace App\Services;

use App\Models\Categoria;
use App\Models\IngresoDetalle;
use App\Models\Marca;
use App\Services\HistorialAccionService;
use App\Models\ProductoSucursal;
use App\Models\Producto;
use App\Models\Sucursal;
use App\Models\UnidadMedida;
use App\Models\User;
use Illuminate\Http\UploadedFile;
use Exception;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;

class ProductoSucursalService
{
    private $modulo = "PRODUCTOS SUCURSAL";

    public function __construct(
        private  CargarArchivoService $cargarArchivoService,
        private HistorialAccionService $historialAccionService,
        private KardexProductoService $kardex_producto_service
    ) {}

    public function listado(
        $sucursal_id = "",
        $categoria_id = "",
        $marca_id = "",
        $nombreProducto = "",
        $activo = NULL,
    ): Collection {
        $productos = Producto::select(
            'productos.*',
            DB::raw('COALESCE(SUM(producto_sucursals.stock_actual),0) as stock_total')

        )->with(["categoria:id,nombre", "marca:id,nombre"])
            ->leftJoin('producto_sucursals', function ($join) use ($sucursal_id) {
                $join->on('productos.id', '=', 'producto_sucursals.producto_id');
                if (!empty($sucursal_id) && $sucursal_id != 'todos') {
                    $join->where('producto_sucursals.sucursal_id', $sucursal_id);
                }

                if (Auth::user()->tipo != 'ADMINISTRACIÓN') {
                    $join->where("producto_sucursals.sucursal_id", Auth::user()->sucursal_id);
                }
            });

        if (!empty($categoria_id) && $categoria_id != 'todos') {
            // Log::debug("categoria");
            $productos->where('productos.categoria_id', $categoria_id);
        }

        if (!empty($marca_id) && $marca_id != 'todos') {
            $productos->where('productos.marca_id', $marca_id);
        }

        if (!empty(trim($nombreProducto))) {
            $productos->where('productos.nombre', 'like', "%{$nombreProducto}%");
        }

        if ($activo != NULL) {
            $productos->where("activo", $activo);
        }

        return $productos
            ->groupBy('productos.id')
            ->get();
    }

    /**
     * Lista de producto_sucursals paginado con filtros
     *
     * @param integer $length
     * @param integer $page
     * @param string $search
     * @param integer|null $sucursal_id
     * @param integer|null $categoria_id
     * @param integer|null $marca_id
     * @param string|null $nombreProducto
     * @param integer|null $activo
     * @param array $orderBy
     * @return LengthAwarePaginator
     */
    public function listadoPaginado(
        int $length,
        int $page,
        string $search,
        array $columnsSerachLike,
        $sucursal_id = "",
        $categoria_id = "",
        $marca_id = "",
        $nombreProducto = "",
        $activo = NULL,
        array $orderBy = []
    ): LengthAwarePaginator {
        $stockQuery = DB::table('producto_sucursals')
            ->select(
                'producto_id',
                DB::raw('COALESCE(SUM(stock_actual), 0) as stock_total')
            )
            ->when(
                !empty($sucursal_id) && $sucursal_id !== 'todos',
                function ($query) use ($sucursal_id) {
                    $query->where('sucursal_id', $sucursal_id);
                }
            )
            ->when(
                Auth::user()->tipo !== 'ADMINISTRACIÓN',
                function ($query) {
                    $query->where('sucursal_id', Auth::user()->sucursal_id);
                }
            )
            ->groupBy('producto_id');

        $productos = Producto::query()
            ->select(
                'productos.id',
                'productos.codigo',
                'productos.nombre',
                'productos.tipo',
                'productos.categoria_id',
                'productos.marca_id',
                'productos.unidad_medida_id',
                'productos.precio',
                'productos.precio_compra',
                "productos.duracion_dias",
                "productos.horario",
                "productos.hora_ini",
                "productos.hora_fin",
                "productos.indefinido",
                'productos.stock_min',
                'productos.imagen',
                'productos.activo',
                DB::raw('COALESCE(stock_totales.stock_total, 0) as stock_total')
            )
            ->leftJoinSub($stockQuery, 'stock_totales', function ($join) {
                $join->on('productos.id', '=', 'stock_totales.producto_id');
            })
            ->with([
                'categoria:id,nombre',
                'marca:id,nombre',
            ]);

        if (!empty($categoria_id) && $categoria_id !== 'todos') {
            $productos->where('productos.categoria_id', $categoria_id);
        }

        if (!empty($marca_id) && $marca_id !== 'todos') {
            $productos->where('productos.marca_id', $marca_id);
        }

        if (!empty(trim($nombreProducto))) {
            $productos->where(function ($query) use ($nombreProducto) {
                $query->where('productos.nombre', 'LIKE', "%{$nombreProducto}%")
                    ->orWhere('productos.codigo', 'LIKE', "%{$nombreProducto}%");
            });
        }

        if ($activo !== null) {
            $productos->where('productos.activo', $activo);
        }

        if (!empty($search) && !empty($columnsSerachLike)) {
            $productos->where(function ($query) use ($search, $columnsSerachLike) {
                foreach ($columnsSerachLike as $col) {
                    $query->orWhere($col, 'LIKE', "%{$search}%");
                }
            });
        }

        foreach ($orderBy as $value) {
            if (isset($value[0], $value[1])) {
                $productos->orderBy($value[0], $value[1]);
            }
        }

        return $productos->paginate(
            $length,
            ['*'],
            'page',
            $page
        );
    }

    /**
     * Crear producto_sucursal
     *
     * @param array $datos
     * @return ProductoSucursal
     */
    public function crear(array $datos): ProductoSucursal
    {
        $producto_sucursal = ProductoSucursal::create([
            "nombre" => mb_strtoupper($datos["nombre"]),
        ]);

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "CREACIÓN", "REGISTRO UNA CATEGORIA", $producto_sucursal);

        return $producto_sucursal;
    }

    /**
     * Actualizar producto_sucursal
     *
     * @param array $datos
     * @param ProductoSucursal $producto_sucursal
     * @return ProductoSucursal
     */
    public function actualizar(array $datos, ProductoSucursal $producto_sucursal): ProductoSucursal
    {
        $old_producto_sucursal = clone $producto_sucursal;

        $producto_sucursal->update([
            "nombre" => mb_strtoupper($datos["nombre"]),
        ]);

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "MODIFICACIÓN", "ACTUALIZÓ UNA CATEGORIA", $old_producto_sucursal, $producto_sucursal->withoutRelations());

        return $producto_sucursal;
    }

    /**
     * Eliminar producto_sucursal
     *
     * @param ProductoSucursal $producto_sucursal
     * @return boolean
     */
    public function eliminar(ProductoSucursal $producto_sucursal): bool|Exception
    {
        $old_producto_sucursal = clone $producto_sucursal;
        $usos = Producto::where("producto_sucursal_id", $producto_sucursal->id)->count();
        if ($usos > 0) {
            throw new Exception("No se puede eliminar este tipo de documento porque está siendo utilizado por $usos productos.");
        }

        $producto_sucursal->delete();

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "ELIMINACIÓN", "ELIMINÓ UNA CATEGORIA", $old_producto_sucursal, $producto_sucursal);

        return true;
    }




    public function getCantidadLotesProducto($sucursal_id, $producto_id, $cantidad_requerida)
    {
        // Obtener los lotes disponibles del producto, ordenados por antigüedad (FIFO).
        $producto = Producto::find($producto_id);
        $ingreso_detalles = IngresoDetalle::select([
            "id",
            "cantidad_fisica",
            "disponible"
        ])
            ->where("sucursal_id", $sucursal_id)
            ->where("producto_id", $producto_id)
            ->where("disponible", ">", 0)
            ->orderBy("id", "asc")
            ->get();

        // Calcular el stock total disponible.
        $total_disponible = $ingreso_detalles->sum("disponible");

        // Validar que exista stock suficiente para atender la cantidad requerida.
        if ($total_disponible < $cantidad_requerida) {

            $nombre_producto = $producto
                ? $producto->nombre
                : "ID {$producto_id}";

            throw new Exception(
                "Stock insuficiente del producto {$nombre_producto}. Stock actual: {$total_disponible}"
            );
        }

        // Inicializar el arreglo de lotes que se utilizarán en la venta.
        $venta_lotes = [];

        // Cantidad que todavía falta cubrir.
        $cantidad_pendiente = $cantidad_requerida;

        // Recorrer los lotes disponibles siguiendo el orden FIFO.
        foreach ($ingreso_detalles as $detalle) {

            // Determinar cuánto se puede utilizar de este lote.
            $cantidad_usar = min(
                $detalle->disponible,
                $cantidad_pendiente
            );

            // Registrar el lote y la cantidad que se utilizará.
            $venta_lotes[] = [
                "id" => 0,
                "venta_id" => "",
                "venta_detalle_id" => "",
                "ingreso_detalle_id" => $detalle->id,
                "cantidad" => $cantidad_usar,
                "costo_unitario" => $detalle->costo,
                "costo_total" => $cantidad_usar * $detalle->costo,
            ];

            // Descontar la cantidad utilizada de la cantidad pendiente.
            $cantidad_pendiente -= $cantidad_usar;

            // Si ya se cubrió la cantidad requerida, finalizar el recorrido.
            if ($cantidad_pendiente <= 0) {
                break;
            }
        }

        // Retornar los lotes que se utilizarán para completar la venta.
        return ["producto" => $producto, "venta_lotes" => $venta_lotes];
    }

    public function obtenerLotesFIFO(
        int $sucursalId,
        int $productoId,
        float $cantidadSolicitada
    ): array {
        $lotes = IngresoDetalle::query()
            ->whereHas('ingreso_producto', function ($q) use ($sucursalId) {
                $q->where('sucursal_id', $sucursalId);
            })
            ->where('producto_id', $productoId)
            ->where('disponible', '>', 0)
            ->orderBy('id')
            ->lockForUpdate()
            ->get();

        $stockDisponible = (float) $lotes->sum('disponible');

        if ($stockDisponible < $cantidadSolicitada) {
            throw new \Exception(
                "Stock insuficiente. Solicitado: {$cantidadSolicitada}, " .
                    "disponible: {$stockDisponible}"
            );
        }

        $pendiente = $cantidadSolicitada;
        $salidas = [];

        foreach ($lotes as $lote) {
            if ($pendiente <= 0) {
                break;
            }

            $stockLote = (float) $lote->disponible;
            $cantidadSalida = min($pendiente, $stockLote);

            $costoUnitario = (float) $lote->costo_unitario;
            $costoTotal = $cantidadSalida * $costoUnitario;

            $salidas[] = [
                'ingreso_detalle_id' => $lote->id,
                'cantidad' => $cantidadSalida,
                'costo_unitario' => $costoUnitario,
                'costo_total' => $costoTotal,
            ];

            $pendiente -= $cantidadSalida;
        }

        return $salidas;
    }

    public function cargaProductoSucursals($datos)
    {
        $fecha_actual = date("Y-m-d");
        $sucursal_id = $datos["sucursal_id"];

        $sucursal = Sucursal::findOrFail($sucursal_id);

        $archivo = $datos["archivo"];

        $extension = '.' . $archivo->getClientOriginalExtension();

        if ($extension == '.xlsx') {
            $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
        } else {
            $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xls();
        }

        $spreadsheet = $reader->load($archivo);

        $hoja = $spreadsheet->getActiveSheet();

        $filas = $hoja->toArray(null, true, true, true);

        if (empty($filas)) {
            throw new \Exception("El archivo Excel está vacío.");
        }

        /*
     * ============================================================
     * 1. VALIDAR ENCABEZADOS
     * ============================================================
     */

        $encabezadosEsperados = [
            "A" => "CÓDIGO*",
            "B" => "NOMBRE*",
            "C" => "CATEGORÍA*",
            "D" => "MARCA*",
            "E" => "UNIDAD MEDIDA*",
            "F" => "CARACTERISTICAS",
            "G" => "CALIDAD*",
            "H" => "COBERTURA",
            "I" => "FORMATO",
            "J" => "PRECIO 1*",
            "K" => "PRECIO 2",
            "L" => "PRECIO 3",
            "M" => "PRECIO 4",
            "N" => "STOCK MÍNIMO*",
            "O" => "PRECIO COMPRA*",
            "P" => "STOCK",
        ];

        $encabezados = array_shift($filas);

        foreach ($encabezadosEsperados as $columna => $encabezadoEsperado) {

            $encabezadoActual = trim(
                strtoupper($encabezados[$columna] ?? "")
            );

            if ($encabezadoActual !== $encabezadoEsperado) {
                throw new \Exception(
                    "El encabezado de la columna {$columna} debe ser '{$encabezadoEsperado}'."
                );
            }
        }

        /*
     * ============================================================
     * 2. CARGAR RELACIONES
     * ============================================================
     */

        $categorias = Categoria::get()
            ->keyBy(fn($item) => mb_strtoupper(trim($item->nombre)));

        $marcas = Marca::get()
            ->keyBy(fn($item) => mb_strtoupper(trim($item->nombre)));

        $unidades = UnidadMedida::get()
            ->keyBy(fn($item) => mb_strtoupper(trim($item->nombre)));

        /*
     * ============================================================
     * 3. OBTENER CÓDIGOS DEL EXCEL
     * ============================================================
     */

        $codigosExcel = [];

        foreach ($filas as $fila) {

            $codigo = trim((string) ($fila["A"] ?? ""));

            if ($codigo !== "") {
                $codigosExcel[] = $codigo;
            }
        }

        $codigosExcel = array_values(array_unique($codigosExcel));

        /*
     * ============================================================
     * 4. BUSCAR PRODUCTOS EXISTENTES
     * ============================================================
     *
     * Si el producto existe:
     *     -> NO se crea nuevamente.
     *
     * Si no existe:
     *     -> Se crea.
     */

        $productosExistentes = Producto::whereIn("codigo", $codigosExcel)
            ->get()
            ->keyBy(fn($producto) => trim((string) $producto->codigo));

        /*
     * ============================================================
     * 5. PROCESAR PRODUCTOS
     * ============================================================
     */
        $productosNuevos = [];
        $codigosProcesados = [];

        foreach ($filas as $indice => $fila) {
            // Excel empieza en fila 1.
            // Como quitamos el encabezado, sumamos 2.
            $filaExcel = $indice + 2;
            /*
         * Ignorar filas completamente vacías
         */

            if (
                empty(array_filter(
                    $fila,
                    fn($valor) => trim((string) $valor) !== ""
                ))
            ) {
                continue;
            }

            /*
         * ========================================================
         * DATOS
         * ========================================================
         */

            $codigo = trim((string) ($fila["A"] ?? ""));
            $nombre = trim((string) ($fila["B"] ?? ""));
            $categoria = trim((string) ($fila["C"] ?? ""));
            $marca = trim((string) ($fila["D"] ?? ""));
            $unidadMedida = trim((string) ($fila["E"] ?? ""));

            $caracteristicas = trim((string) ($fila["F"] ?? ""));
            $calidad = trim((string) ($fila["G"] ?? ""));
            $cobertura = trim((string) ($fila["H"] ?? ""));
            $formato = trim((string) ($fila["I"] ?? ""));

            $precio1 = $fila["J"] ?? null;
            $precio2 = $fila["K"] ?? null;
            $precio3 = $fila["L"] ?? null;
            $precio4 = $fila["M"] ?? null;

            $stockMin = $fila["N"] ?? null;
            $precioCompra = $fila["O"] ?? null;

            // NUEVO: STOCK
            $stock = $fila["P"] ?? null;

            /*
         * ========================================================
         * CAMPOS OBLIGATORIOS
         * ========================================================
         */

            if ($codigo === "") {
                throw new \Exception(
                    "La columna CÓDIGO es obligatoria. Fila: {$filaExcel}"
                );
            }

            if ($nombre === "") {
                throw new \Exception(
                    "La columna NOMBRE es obligatoria. Fila: {$filaExcel}"
                );
            }

            if ($categoria === "") {
                throw new \Exception(
                    "La columna CATEGORÍA es obligatoria. Fila: {$filaExcel}"
                );
            }

            if ($marca === "") {
                throw new \Exception(
                    "La columna MARCA es obligatoria. Fila: {$filaExcel}"
                );
            }

            if ($unidadMedida === "") {
                throw new \Exception(
                    "La columna UNIDAD MEDIDA es obligatoria. Fila: {$filaExcel}"
                );
            }

            if ($calidad === "") {
                throw new \Exception(
                    "La columna CALIDAD es obligatoria. Fila: {$filaExcel}"
                );
            }

            if ($precio1 === null || $precio1 === "") {
                throw new \Exception(
                    "La columna PRECIO 1 es obligatoria. Fila: {$filaExcel}"
                );
            }

            if ($stockMin === null || $stockMin === "") {
                throw new \Exception(
                    "La columna STOCK MÍNIMO es obligatoria. Fila: {$filaExcel}"
                );
            }

            if ($precioCompra === null || $precioCompra === "") {
                throw new \Exception(
                    "La columna PRECIO COMPRA es obligatoria. Fila: {$filaExcel}"
                );
            }

            /*
         * ========================================================
         * VALIDAR NÚMEROS
         * ========================================================
         */

            $camposNumericos = [
                "PRECIO 1" => $precio1,
                "PRECIO 2" => $precio2,
                "PRECIO 3" => $precio3,
                "PRECIO 4" => $precio4,
                "STOCK MÍNIMO" => $stockMin,
                "PRECIO COMPRA" => $precioCompra,
            ];

            foreach ($camposNumericos as $campo => $valor) {

                if (
                    $valor !== null &&
                    $valor !== "" &&
                    !is_numeric($valor)
                ) {
                    throw new \Exception(
                        "El campo {$campo} debe ser numérico. Fila: {$filaExcel}"
                    );
                }
            }

            /*
         * ========================================================
         * VALIDAR STOCK
         * ========================================================
         *
         * STOCK es opcional.
         *
         * Si viene vacío:
         *     -> No se modifica ProductoSucursal.
         *
         * Si viene con valor:
         *     -> Debe ser numérico.
         */

            if (
                $stock !== null &&
                $stock !== "" &&
                !is_numeric($stock)
            ) {
                throw new \Exception(
                    "El campo STOCK debe ser numérico. Fila: {$filaExcel}"
                );
            }

            /*
         * Convertimos STOCK vacío a null.
         */

            $stock = (
                $stock !== null &&
                $stock !== ""
            )
                ? (float) $stock
                : null;

            /*
         * No permitir stock negativo.
         */

            if ($stock !== null && $stock < 0) {
                throw new \Exception(
                    "El campo STOCK no puede ser negativo. Fila: {$filaExcel}"
                );
            }

            /*
         * ========================================================
         * VALIDAR CÓDIGO DUPLICADO EN EL EXCEL
         * ========================================================
         */

            if (isset($codigosProcesados[$codigo])) {
                throw new \Exception(
                    "El código '{$codigo}' está repetido en el Excel. " .
                        "Filas: {$codigosProcesados[$codigo]} y {$filaExcel}"
                );
            }

            $codigosProcesados[$codigo] = $filaExcel;

            /*
         * ========================================================
         * SI EL PRODUCTO NO EXISTE -> PREPARAR PARA CREAR
         * ========================================================
         */

            if (!isset($productosExistentes[$codigo])) {

                /*
             * CATEGORÍA
             */

                $categoriaKey = mb_strtoupper(trim($categoria));

                if (!isset($categorias[$categoriaKey])) {
                    $categorias[$categoriaKey] = Categoria::firstOrCreate(["nombre" => $categoria,]);
                }

                /*
             * MARCA
             */

                $marcaKey = mb_strtoupper(trim($marca));

                if (!isset($marcas[$marcaKey])) {
                    $marcas[$marcaKey] = Marca::firstOrCreate(["nombre" => trim($marca),]);
                }

                /*
             * UNIDAD DE MEDIDA
             */

                $unidadKey = mb_strtoupper(trim($unidadMedida));

                if (!isset($unidades[$unidadKey])) {
                    $unidades[$unidadKey] = UnidadMedida::firstOrCreate(["nombre" => trim($unidadMedida),]);
                }

                /*
             * PREPARAR PRODUCTO NUEVO
             */

                $productosNuevos[] = [
                    "codigo" => $codigo,
                    "nombre" => $nombre,

                    "categoria_id" => $categorias[$categoriaKey]->id,
                    "marca_id" => $marcas[$marcaKey]->id,
                    "unidad_medida_id" => $unidades[$unidadKey]->id,

                    "calidad" => $calidad,
                    "caracteristicas" => $caracteristicas,
                    "cobertura" => $cobertura,
                    "formato" => $formato,

                    "precio" => $precio1,
                    "precio2" => $precio2 ?: null,
                    "precio3" => $precio3 ?: null,
                    "precio4" => $precio4 ?: null,

                    "precio_compra" => $precioCompra,
                    "stock_min" => $stockMin,

                    "activo" => 1,
                    "fecha_registro" => $fecha_actual,
                ];
            }
        }

        /*
     * ============================================================
     * 6. INSERTAR PRODUCTOS NUEVOS
     * ============================================================
     */

        if (!empty($productosNuevos)) {

            Producto::insert($productosNuevos);
        }

        /*
     * ============================================================
     * 7. VOLVER A OBTENER TODOS LOS PRODUCTOS
     * ============================================================
     *
     * Aquí tendremos tanto los existentes como los recién creados.
     */

        $productos = Producto::whereIn("codigo", $codigosExcel)
            ->get()
            ->keyBy(fn($producto) => trim((string) $producto->codigo));

        /*
     * ============================================================
     * 8. OBTENER STOCK ACTUAL DE LA SUCURSAL / ALMACÉN
     * ============================================================
     */

        $productoSucursal = ProductoSucursal::where(
            "sucursal_id",
            $sucursal->id
        )
            ->where("sucursal_id", $sucursal_id)
            ->whereIn(
                "producto_id",
                $productos->pluck("id")
            )
            ->get()
            ->keyBy("producto_id");

        /*
     * ============================================================
     * 9. INCREMENTAR / CREAR STOCK
     * ============================================================
     */

        foreach ($filas as $indice => $fila) {
            $filaExcel = $indice + 2;
            /*
         * Ignorar filas vacías
         */
            if (
                empty(array_filter(
                    $fila,
                    fn($valor) => trim((string) $valor) !== ""
                ))
            ) {
                continue;
            }

            $codigo = trim((string) ($fila["A"] ?? ""));

            $stock = $fila["L"] ?? null;

            /*
         * Si STOCK está vacío no hacemos nada.
         */

            if ($stock === null || $stock === "") {
                continue;
            }

            /*
         * Ya fue validado anteriormente,
         * pero lo convertimos a número.
         */

            $stock = (float) $stock;

            /*
         * Obtener producto
         */

            $producto = $productos[$codigo] ?? null;

            if (!$producto) {
                throw new \Exception(
                    "No se pudo encontrar el producto con código '{$codigo}'. " .
                        "Fila: {$filaExcel}"
                );
            }


            $registro_producto = Producto::findOrFail($producto->id);
            $registro = $this->kardex_producto_service->registrarMovimiento($sucursal->id, "CARGA MASIVA", "INGRESO", NULL, $registro_producto, $stock, $registro_producto->precio_compra, "INCREMENTO DE STOCK", "", 0);

            $productoSucursal[$producto->id] = $registro;
        }

        /*
     * ============================================================
     * 10. RESULTADO
     * ============================================================
     */

        return count($productosNuevos);
    }
}
