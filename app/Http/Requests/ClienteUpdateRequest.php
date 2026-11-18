<?php

namespace App\Http\Requests;

use App\Rules\ClienteCiComplementoRule;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class ClienteUpdateRequest extends FormRequest
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
        $rule = [
            "nombre" => "required|string",
            "paterno" => "required|string",
            "materno" => "nullable|string",
            // "nro_documento" => [
            //     "required",
            //     new ClienteCiComplementoRule($this->tipo_documento_id, $this->complemento, null)
            // ],
            "ci" => "required|unique:clientes,ci," . $this->cliente->id,
            "ci_exp" => "required",
            "fecha_nac" => "required|date",
            "dir" => "nullable|string",
            "fono" => "nullable|string",
            "nom_ref" => "nullable|string",
            "fono_ref" => "nullable|string",
            "correo" => "nullable|email",
        ];

        if ($this->foto && !is_string($this->foto)) {
            $rules["foto"] = "image|mimes:jpeg,png,jpg,gif,svg|max:4096";
        }
        return $rule;
    }
    public function messages(): array
    {
        return [
            "nombre.required" => "Debes completar este campo",
            "nombre.string" => "Debes ingresar un texto valido",
            "paterno.required" => "Debes completar este campo",
            "paterno.string" => "Debes ingresar un texto valido",
            "materno.string" => "Debes ingresar un texto valido",
            "ci.required" => "Debes completar este campo",
            "ci.unique" => "Este documento ya fue registrado",
            "ci_exp.required" => "Debes completar este campo",
            "fecha_nac.required" => "Debes completar este campo",
            "fecha_nac.date" => "Debes ingresar una fecha valida",
            "dir.string" => "Debes ingresar un texto valido",
            "fono.string" => "Debes ingresar un texto valido",
            "nom_ref.string" => "Debes ingresar un texto valido",
            "fono_ref.string" => "Debes ingresar un texto valido",
            "correo.email" => "Debes ingresar un correo valido",
            "foto.required" => "Debes completar este campo",
            "foto.mimes" => "La foto debe ser jpeg,jpg,png,gif,svg",
            "foto.max" => "La foto no puede pesar mas de 4MB",
        ];
    }
}
