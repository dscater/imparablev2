<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class PromocionUpdateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        $rules = [
            "nombre" => "required|unique:promocions,nombre," . $this->promocion->id,
            "descripcion" => "required|string|min:2",
            "tipo" => "required",
            "indefinido" => "required",
            "fecha_ini" => "required",
            "cantidad" => "nullable|",
            "porcentaje_monto" => "required",
        ];


        if ($this->indefinido == 0) {
            $rules["fecha_fin"] = "required";
        }

        if ($this->porcentaje_monto == 'PORCENTAJE') {
            $rules["porcentaje"] = "required|numeric";
        }

        if ($this->porcentaje_monto == 'MONTO') {
            $rules["monto"] = "required|numeric";
        }

        return $rules;
    }

    public function attributes()
    {
        return [
            "nombre" => "Nombre Promoción/Descuento",
            "descripcion" => "Descripción",
            "tipo" => "Tipo",
            "indefinido" => "Indefinido",
            "fecha_ini" => "Fecha Inicio",
            "cantidad" => "Cantidad",
            "porcentaje_monto" => "Porcentaje/Monto",
            "fecha_fin" => "Fecha Finalización",
            "porcentaje" => "Porcentaje",
            "monto" => "Monto",
        ];
    }
}
