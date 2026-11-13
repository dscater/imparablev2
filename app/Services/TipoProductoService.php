<?php

namespace App\Services;

class TipoProductoService
{
    public function listado()
    {
        return [
            [
                "value" => "PRODUCTO",
                "label" => "PRODUCTO",
                "icon" => "fa fa-box",
            ],
            [
                "value" => "SERVICIO",
                "label" => "SERVICIO",
                "icon" => "fa fa-user-shield",
            ],
            [
                "value" => "PLAN",
                "label" => "PLAN",
                "icon" => "fa fa-dumbbel",
            ],
        ];
    }
}
