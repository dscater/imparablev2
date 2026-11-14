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
                "detail" => "Aquellos items que necesitan de un stock para ser vendidos"
            ],
            [
                "value" => "SERVICIO",
                "label" => "SERVICIO",
                "icon" => "fa fa-user-shield",
                "detail" => "Servicios que ofrece el negocio y no necesitan de stock disponible"
            ],
            [
                "value" => "PLAN",
                "label" => "PLAN",
                "icon" => "fa fa-dumbbell",
                "detail" => "Servicios que tienen un tiempo de duración definido y cuentan de una SUSCRIPCIÓN o INSCRIPCIÓN"
            ],
        ];
    }
}
