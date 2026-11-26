<?php

namespace App\Rules;

use App\Services\TipoVentaService;
use Closure;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Translation\PotentiallyTranslatedString;

class VentaMetodosRule implements ValidationRule
{

    protected $tipoVenta;

    public function __construct(TipoVentaService $tipo_venta_service, $tipoVenta = NULL)
    {
        $this->tipoVenta = $tipoVenta;
        if (!$tipoVenta) {
            $this->tipoVenta = $tipo_venta_service->listado()[0]['value'];
        }
    }

    /**
     * Run the validation rule.
     *
     * @param  Closure(string, ?string=): PotentiallyTranslatedString  $fail
     */
    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        if ($this->tipoVenta == 'AL CONTADO' && empty($value)) {
            $fail('Debes ingresar al menos 1 método de pago');
            return;
        }

        foreach ($value as $index => $detalle) {
            // precio
            if ($detalle['precio'] === "" || $detalle['precio'] === null) {
                $fail("El precio del producto " . ($index + 1) . " es obligatorio.");
            }

            // cantidad
            if ($detalle['cantidad'] === "" || $detalle['cantidad'] === null) {
                $fail("La cantidad del producto " . ($index + 1) . " es obligatorio.");
            }

            if (!is_numeric($detalle['cantidad']) || $detalle['cantidad'] < 0) {
                $fail("La cantidad del producto " . ($index + 1) . " debe ser mayor a 0.");
            }
        }
    }
}
