<?php

namespace App\Services;

class ListCondicionService
{
    public function listado()
    {
        return [
            [
                "value" => "NORMAL",
                "label" => "NORMAL",
                "icon" => "fa fa-list",
                "detail" => "Se aplica siempre y cuando cumpla las reglas definidas a continuación como fechas de inicio y finalización; o cantidades"
            ],
            [
                "value" => "CUMPLEANERO",
                "label" => "CUMPLEAÑERO",
                "icon" => "fas fa-birthday-cake",
                "detail" => "Se aplica solo a aquellas inscripciones que se realicen el día del cumpleaños del beneficiario"
            ],
        ];
    }
}
