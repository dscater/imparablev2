<?php

namespace App\Http\Controllers;

use App\Services\TipoProductoService;
use Illuminate\Http\Request;

class TipoProductoController extends Controller
{
    public function __construct(private TipoProductoService $tipo_producto_service) {}

    public function listado()
    {
        return response()->JSON([
            "tipo_productos" => $this->tipo_producto_service->listado()
        ]);
    }
}
