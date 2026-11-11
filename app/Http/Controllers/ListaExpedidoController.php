<?php

namespace App\Http\Controllers;

use App\Services\ListaExpedidoService;
use Illuminate\Http\Request;

class ListaExpedidoController extends Controller
{
    public function __construct(private ListaExpedidoService $lista_expedido_service) {}

    public function listado()
    {
        return response()->JSON([
            "lista_expedidos" => $this->lista_expedido_service->listado()
        ]);
    }
}
