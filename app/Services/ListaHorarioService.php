<?php

namespace App\Services;

class ListaHorarioService
{
    public function listado()
    {
        return [
            [
                "value" => "COMPLETO",
                "label" => "COMPLETO",
                "icon" => "fa fa-clock",
            ],
            [
                "value" => "MAÑANA",
                "label" => "MAÑANA",
                "icon" => "fa fa-clock",
            ],
            [
                "value" => "TARDE",
                "label" => "TARDE",
                "icon" => "fa fa-clock",
            ],
            [
                "value" => "NOCHE",
                "label" => "NOCHE",
                "icon" => "fa fa-clock",
            ],
        ];
    }
}
