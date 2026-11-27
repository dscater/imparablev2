<?php

namespace App\Http\Requests;

use App\Rules\VentaDetalleRule;
use App\Rules\VentaMetodosRule;
use App\Services\TipoVentaService;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Log;

class VentaStoreRequest extends FormRequest
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
        $tipo_venta_service = new TipoVentaService();

        $rules = [
            "sucursal_id" => "required",
            "cliente_id" => "nullable",
            "tipo_venta" => "required",
            "descripcion" => "nullable",
            "subtotal" => "required|decimal:0,2|min:0",
            "descuento" => "nullable|decimal:0,2|min:0",
            "porcentaje_descuento" => "nullable|numeric|min:0",
            "total" => "required|decimal:0,2|min:0",
            "saldo" => "required|decimal:0,2|min:0",
            "venta_detalles" => ["required", new VentaDetalleRule()],
        ];

        if ($this->tipo_venta == 'AL CONTADO') {
            $rules["venta_metodos"] = ["required", new VentaMetodosRule($tipo_venta_service, $this->tipo_venta)];
        } else {
            $rules["venta_metodos"] = ["nullable", new VentaMetodosRule($tipo_venta_service, $this->tipo_venta)];
        }

        return $rules;
    }

    public function messages()
    {
        return [
            "sucursal_id.required" => "Debes indicar el almacén",
            "cliente_id.required" => "Debes seleccionar el cliente",
            "tipo_venta.required" => "Debes seleccionar el tipo de venta",
            "tipo_documento_id.required" => "Debes seleccionar el tipo de documento",
            "descripcion.required" => "Debes completar este campo",
            "cantidad.required" => "No se encontró el total de la compra",
            "tipo_pago.required" => "Debes seleccionar el tipo de pago",
            "total.required" => "El total de la venta es obligatorio",
            "saldo.required" => "El total de la venta es obligatorio",
            "saldo.numeric" => "El saldo debe ser un valor númerico",
            "descuento.numeric" => "El descuento debe ser un valor númerico",
            "venta_detalles.required" => "Debes agregar al menos un producto",
            "venta_metodos.required" => "Debes agregar al menos un método de pago"
        ];
    }
}
