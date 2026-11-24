<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class MetodoPagoStoreRequest extends FormRequest
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
        return [
            "nombre" => "required|unique:metodo_pagos,nombre",
            "descripcion" => "nullable|string",
            "icon" => "nullable|string",
        ];
    }

    public function messages()
    {
        return [
            "nombre.required" => "Debes completar este campo",
            "descripcion.required" => "Debes completar este campo",
            "descripcion.string" => "Debes ingresar un texto valido",
            "icon.required" => "Debes completar este campo",
            "icon.string" => "Debes ingresar un texto valido",
        ];
    }
}
