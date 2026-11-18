<?php

namespace App\Http\Controllers;

use App\Http\Requests\MetodoPagoStoreRequest;
use App\Http\Requests\MetodoPagoUpdateRequest;
use App\Models\MetodoPago;
use App\Models\User;
use App\Services\MetodoPagoService;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;
use Inertia\Response as ResponseInertia;

class MetodoPagoController extends Controller
{
    public function __construct(private MetodoPagoService $metodo_pagoService) {}

    /**
     * Página index
     *
     * @return Response
     */
    public function index(): ResponseInertia
    {
        return Inertia::render("Admin/MetodoPagos/Index");
    }

    /**
     * Listado de metodo_pagos sin ids: 1 y 2
     *
     * @return JsonResponse
     */
    public function listado(): JsonResponse
    {
        return response()->JSON([
            "metodo_pagos" => $this->metodo_pagoService->listado()
        ]);
    }

    public function paginado(Request $request)
    {
        $perPage = $request->perPage;
        $page = (int)($request->input("page", 1));
        $search = (string)$request->input("search", "");
        $orderBy = $request->orderBy;
        $orderAsc = $request->orderAsc;

        $columnsSerachLike = [
            "nombre",
            "descripcion",
        ];
        $columnsFilter = [];
        $columnsBetweenFilter = [];
        $arrayOrderBy = [];
        if ($orderBy && $orderAsc) {
            $arrayOrderBy = [
                [$orderBy, $orderAsc]
            ];
        }

        $metodo_pagos = $this->metodo_pagoService->listadoPaginado($perPage, $page, $search, $columnsSerachLike, $columnsFilter, $columnsBetweenFilter, $arrayOrderBy);
        return response()->JSON([
            "data" => $metodo_pagos->items(),
            "total" => $metodo_pagos->total(),
            "lastPage" => $metodo_pagos->lastPage()
        ]);
    }

    /**
     * Registrar un nuevo metodo_pago
     *
     * @param MetodoPagoStoreRequest $request
     * @return RedirectResponse|Response
     */
    public function store(MetodoPagoStoreRequest $request): RedirectResponse|Response
    {
        DB::beginTransaction();
        try {
            // crear el MetodoPago
            $this->metodo_pagoService->crear($request->validated());
            DB::commit();
            return redirect()->route("metodo_pagos.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    /**
     * Mostrar un metodo_pago
     *
     * @param MetodoPago $metodo_pago
     * @return JsonResponse
     */
    public function show(MetodoPago $metodo_pago): JsonResponse
    {
        return response()->JSON($metodo_pago);
    }

    public function update(MetodoPago $metodo_pago, MetodoPagoUpdateRequest $request)
    {
        DB::beginTransaction();
        try {
            // actualizar metodo_pago
            $this->metodo_pagoService->actualizar($request->validated(), $metodo_pago);
            DB::commit();
            return redirect()->route("metodo_pagos.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            // Log::debug($e->getMessage());
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    /**
     * Eliminar metodo_pago
     *
     * @param MetodoPago $metodo_pago
     * @return JsonResponse|Response
     */
    public function destroy(MetodoPago $metodo_pago): JsonResponse|Response
    {
        DB::beginTransaction();
        try {
            $this->metodo_pagoService->eliminar($metodo_pago);
            DB::commit();
            return response()->JSON([
                'sw' => true,
                'message' => 'El registro se eliminó correctamente'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }
}
