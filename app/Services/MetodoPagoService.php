<?php

namespace App\Services;

use App\Models\IngresoDetalle;
use App\Models\IngresoProducto;
use App\Services\HistorialAccionService;
use App\Models\MetodoPago;
use App\Models\User;
use Illuminate\Http\UploadedFile;
use Exception;
use Illuminate\Container\Attributes\Auth;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Validation\ValidationException;

class MetodoPagoService
{
    private $modulo = "METODOS DE PAGO";

    public function __construct(private  CargarArchivoService $cargarArchivoService, private HistorialAccionService $historialAccionService) {}

    public function listado(): Collection
    {
        $metodo_pagos = MetodoPago::select("metodo_pagos.*")->get();
        return $metodo_pagos;
    }
    /**
     * Lista de metodo_pagos paginado con filtros
     *
     * @param integer $length
     * @param integer $page
     * @param string $search
     * @param array $columnsSerachLike
     * @param array $columnsFilter
     * @return LengthAwarePaginator
     */
    public function listadoPaginado(int $length, int $page, string $search, array $columnsSerachLike = [], array $columnsFilter = [], array $columnsBetweenFilter = [], array $orderBy = []): LengthAwarePaginator
    {
        $metodo_pagos = MetodoPago::select("metodo_pagos.*");

        // Filtros exactos
        foreach ($columnsFilter as $key => $value) {
            if (!is_null($value)) {
                $metodo_pagos->where("metodo_pagos.$key", $value);
            }
        }

        // Filtros por rango
        foreach ($columnsBetweenFilter as $key => $value) {
            if (isset($value[0], $value[1])) {
                $metodo_pagos->whereBetween("metodo_pagos.$key", $value);
            }
        }

        // Búsqueda en múltiples columnas con LIKE
        if (!empty($search) && !empty($columnsSerachLike)) {
            $metodo_pagos->where(function ($query) use ($search, $columnsSerachLike) {
                foreach ($columnsSerachLike as $col) {
                    $query->orWhere("$col", "LIKE", "%$search%");
                }
            });
        }

        // Ordenamiento
        foreach ($orderBy as $value) {
            if (isset($value[0], $value[1])) {
                $metodo_pagos->orderBy($value[0], $value[1]);
            }
        }


        $metodo_pagos = $metodo_pagos->paginate($length, ['*'], 'page', $page);
        return $metodo_pagos;
    }

    /**
     * Crear metodo_pago
     *
     * @param array $datos
     * @return MetodoPago
     */
    public function crear(array $datos): MetodoPago
    {
        $metodo_pago = MetodoPago::create([
            "nombre" => mb_strtoupper($datos["nombre"]),
            "descripcion" => mb_strtoupper($datos["descripcion"]),
            "icon" => $datos["icon"] ?? 'fa fa-minus',
        ]);

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "CREACIÓN", "REGISTRO UN METODO DE PAGO", $metodo_pago);

        return $metodo_pago;
    }

    /**
     * Actualizar metodo_pago
     *
     * @param array $datos
     * @param MetodoPago $metodo_pago
     * @return MetodoPago
     */
    public function actualizar(array $datos, MetodoPago $metodo_pago): MetodoPago
    {
        $old_metodo_pago = clone $metodo_pago;

        $metodo_pago->update([
            "nombre" => mb_strtoupper($datos["nombre"]),
            "descripcion" => mb_strtoupper($datos["descripcion"]),
            "icon" => $datos["icon"] ?? 'fa fa-minus',
        ]);

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "MODIFICACIÓN", "ACTUALIZÓ UN METODO DE PAGO", $old_metodo_pago, $metodo_pago->withoutRelations());

        return $metodo_pago;
    }

    /**
     * Eliminar metodo_pago
     *
     * @param MetodoPago $metodo_pago
     * @return boolean
     */
    public function eliminar(MetodoPago $metodo_pago): bool|Exception
    {
        $old_metodo_pago = clone $metodo_pago;

        $usos = IngresoDetalle::where("metodo_pago_id", $metodo_pago->id)->count();
        if ($usos > 0) {
            throw new Exception("No se puede eliminar este tipo de ingreso porque está siendo utilizado por $usos ingreso de productos.");
        }

        $metodo_pago->delete();

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "ELIMINACIÓN", "ELIMINÓ UN METODO DE PAGO", $old_metodo_pago, $metodo_pago);

        return true;
    }
}
