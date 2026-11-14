<?php

namespace App\Http\Controllers;

use App\Services\ListaHorarioService;
use Illuminate\Http\Request;

class ListaHorarioController extends Controller
{
    public function __construct(private ListaHorarioService $lista_horario_service) {}

    public function listado()
    {
        return response()->JSON([
            "lista_horarios" => $this->lista_horario_service->listado()
        ]);
    }
}
