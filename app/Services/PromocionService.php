<?php

namespace App\Services;

use App\Models\IngresoDetalle;
use App\Models\IngresoProducto;
use App\Services\HistorialAccionService;
use App\Models\Promocion;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\UploadedFile;
use Exception;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;

class PromocionService
{
    private $modulo = "PROMOCIONES";

    public function __construct(private  CargarArchivoService $cargarArchivoService, private HistorialAccionService $historialAccionService) {}

    public function listado(): Collection
    {
        $promocions = Promocion::select("promocions.*")->get();
        return $promocions;
    }
    /**
     * Lista de promocions paginado con filtros
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
        $promocions = Promocion::select("promocions.*");

        // Filtros exactos
        foreach ($columnsFilter as $key => $value) {
            if (!is_null($value)) {
                $promocions->where("promocions.$key", $value);
            }
        }

        // Filtros por rango
        foreach ($columnsBetweenFilter as $key => $value) {
            if (isset($value[0], $value[1])) {
                $promocions->whereBetween("promocions.$key", $value);
            }
        }

        // Búsqueda en múltiples columnas con LIKE
        if (!empty($search) && !empty($columnsSerachLike)) {
            $promocions->where(function ($query) use ($search, $columnsSerachLike) {
                foreach ($columnsSerachLike as $col) {
                    $query->orWhere("$col", "LIKE", "%$search%");
                }
            });
        }

        // Ordenamiento
        foreach ($orderBy as $value) {
            if (isset($value[0], $value[1])) {
                $promocions->orderBy($value[0], $value[1]);
            }
        }


        $promocions = $promocions->paginate($length, ['*'], 'page', $page);
        return $promocions;
    }

    /**
     * Crear promocion
     *
     * @param array $datos
     * @return Promocion
     */
    public function crear(array $datos): Promocion
    {
        $fecha_actual = Carbon::now("America/La_Paz")->format("Y-m-d");

        $user_id = Auth::user()->id;

        $registro = [
            "nombre" => mb_strtoupper($datos["nombre"]),
            "descripcion" => mb_strtoupper($datos["descripcion"]),
            "tipo" => mb_strtoupper($datos["tipo"]),
            "indefinido" => $datos["indefinido"],
            "fecha_ini" => $datos["fecha_ini"],
            "cantidad" => $datos["cantidad"],
            "porcentaje_monto" => mb_strtoupper($datos["porcentaje_monto"]),
            "fecha_registro" => $fecha_actual,
            "user_id" => $user_id
        ];

        if ($datos["indefinido"] == 0) {
            $registro["fecha_fin"] = $datos["fecha_fin"];
        }

        if ($datos["porcentaje_monto"] == 'PORCENTAJE') {
            $registro["porcentaje"] = $datos["porcentaje"];
        }

        if ($datos["porcentaje_monto"] == 'MONTO') {
            $registro["monto"] = $datos["monto"];
        }

        $promocion = Promocion::create($registro);

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "CREACIÓN", "REGISTRO UNA PROMOCION", $promocion);

        return $promocion;
    }

    /**
     * Actualizar promocion
     *
     * @param array $datos
     * @param Promocion $promocion
     * @return Promocion
     */
    public function actualizar(array $datos, Promocion $promocion): Promocion
    {
        $old_promocion = clone $promocion;

        $registro = [
            "nombre" => mb_strtoupper($datos["nombre"]),
            "descripcion" => mb_strtoupper($datos["descripcion"]),
            "tipo" => mb_strtoupper($datos["tipo"]),
            "indefinido" => $datos["indefinido"],
            "fecha_ini" => $datos["fecha_ini"],
            "cantidad" => $datos["cantidad"],
            "porcentaje_monto" => mb_strtoupper($datos["porcentaje_monto"]),
        ];

        if ($datos["indefinido"] == 0) {
            $registro["fecha_fin"] = $datos["fecha_fin"];
        }

        if ($datos["porcentaje_monto"] == 'PORCENTAJE') {
            $registro["porcentaje"] = $datos["porcentaje"];
        }

        if ($datos["porcentaje_monto"] == 'MONTO') {
            $registro["monto"] = $datos["monto"];
        }

        $promocion->update($registro);

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "MODIFICACIÓN", "ACTUALIZÓ UNA PROMOCION", $old_promocion, $promocion->withoutRelations());

        return $promocion;
    }

    /**
     * Eliminar promocion
     *
     * @param Promocion $promocion
     * @return boolean
     */
    public function eliminar(Promocion $promocion): bool|Exception
    {
        $old_promocion = clone $promocion;

        $usos = IngresoDetalle::where("promocion_id", $promocion->id)->count();
        if ($usos > 0) {
            throw new Exception("No se puede eliminar este tipo de ingreso porque está siendo utilizado por $usos ingreso de productos.");
        }

        $promocion->delete();

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "ELIMINACIÓN", "ELIMINÓ UNA PROMOCION", $old_promocion, $promocion);

        return true;
    }
}
