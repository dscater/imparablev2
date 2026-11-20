<?php

namespace App\Http\Controllers;

use App\Http\Requests\PromocionStoreRequest;
use App\Http\Requests\PromocionUpdateRequest;
use App\Models\Promocion;
use App\Models\User;
use App\Services\PromocionService;
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

class PromocionController extends Controller
{
    public function __construct(private PromocionService $promocionService) {}

    /**
     * Página index
     *
     * @return Response
     */
    public function index(): ResponseInertia
    {
        return Inertia::render("Admin/Promocions/Index");
    }

    /**
     * Listado de promocions sin ids: 1 y 2
     *
     * @return JsonResponse
     */
    public function listado(): JsonResponse
    {
        return response()->JSON([
            "promocions" => $this->promocionService->listado()
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

        $promocions = $this->promocionService->listadoPaginado($perPage, $page, $search, $columnsSerachLike, $columnsFilter, $columnsBetweenFilter, $arrayOrderBy);
        return response()->JSON([
            "data" => $promocions->items(),
            "total" => $promocions->total(),
            "lastPage" => $promocions->lastPage()
        ]);
    }

    /**
     * Registrar un nuevo promocion
     *
     * @param PromocionStoreRequest $request
     * @return RedirectResponse|Response
     */
    public function store(PromocionStoreRequest $request): RedirectResponse|Response
    {
        DB::beginTransaction();
        try {
            // crear el Promocion
            $this->promocionService->crear($request->validated());
            DB::commit();
            return redirect()->route("promocions.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    /**
     * Mostrar un promocion
     *
     * @param Promocion $promocion
     * @return JsonResponse
     */
    public function show(Promocion $promocion): JsonResponse
    {
        return response()->JSON($promocion);
    }

    public function update(Promocion $promocion, PromocionUpdateRequest $request)
    {
        DB::beginTransaction();
        try {
            // actualizar promocion
            $this->promocionService->actualizar($request->validated(), $promocion);
            DB::commit();
            return redirect()->route("promocions.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            // Log::debug($e->getMessage());
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    /**
     * Eliminar promocion
     *
     * @param Promocion $promocion
     * @return JsonResponse|Response
     */
    public function destroy(Promocion $promocion): JsonResponse|Response
    {
        DB::beginTransaction();
        try {
            $this->promocionService->eliminar($promocion);
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
