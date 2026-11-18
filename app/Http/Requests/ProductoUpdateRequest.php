<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class ProductoUpdateRequest extends FormRequest
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
            "codigo" => "required|unique:productos,codigo," . $this->producto->id,
            "nombre" => "required",
            "tipo" => "required",
            "caracteristicas" => "nullable|string",
            "activo" => "required",
        ];

        if ($this->tipo == 'PRODUCTO') {
            $rules["categoria_id"] = "required";
            $rules["marca_id"] = "required";
            $rules["unidad_medida_id"] = "required";
            $rules["stock_min"] = "required|numeric|min:0";
            $rules["precio"] = "required|decimal:0,2|gt:0";
            $rules["precio_compra"] = "required|decimal:0,2|gt:0";
        }
        if ($this->tipo == 'SERVICIO') {
            $rules["precio"] = "required|decimal:0,2|gt:0";
        }
        if ($this->tipo == 'PLAN') {
            $rules["duracion_dias"] = "required|numeric|min:1";
            $rules["horario"] = "required";
            $rules["hora_ini"] = "nullable";
            $rules["hora_fin"] = "nullable";
            $rules["indefinido"] = "required";
            $rules["precio"] = "required|decimal:0,2|gt:0";
        }

        if ($this->imagen && !is_string($this->imagen)) {
            $rules["imagen"] = "image|mimes:jpeg,png,jpg,gif,svg|max:4096";
        }

        return $rules;
    }

    public function messages()
    {
        return [
            "codigo.required" => "Debes completar este campo",
            "codigo.unique" => "Este código no esta disponible",
            "nombre.required" => "Debes completar este campo",
            "nombre.unique" => "Este nombre no esta disponible",
            "categoria_id.required" => "Debes completar este campo",
            "marca_id.required" => "Debes completar este campo",
            "unidad_medida_id.required" => "Debes completar este campo",
            "precio.required" => "Debes completar este campo",
            "precio.decimal" => "Debes ingresar un valor númerido de hasta 2 decimales",
            "precio.gt" => "Debes ingresar un valor númerido no puede ser menor o igual a 0",
            "precio_compra.required" => "Debes completar este campo",
            "precio_compra.decimal" => "Debes ingresar un valor númerido de hasta 2 decimales",
            "precio_compra.gt" => "Debes ingresar un valor númerido no puede ser menor o igual a 0",
            "stock_min.required" => "Debes completar este campo",
            "imagen.required" => "Debes completar este campo",
            "imagen.mimes" => "La imagen debe ser jpeg,jpg,png,gif,svg",
            "imagen.max" => "La imagen no puede pesar mas de 4MB",
            "activo.required" => "Debes completar este campo",

            "duracion_dias.required" => "Debes completar este campo",
            "duracion_dias.numeric" => "Debes ingresar un valor númerico",
            "duracion_dias.min" => "Debes ingresar un valor minimo de :min",
            "horario.required" => "Debes completar este campo",
            "hora_ini.required" => "Debes completar este campo",
            "hora_fin.required" => "Debes completar este campo",
            "indefinido.required" => "Debes completar este campo",
        ];
    }
}
