<?php

namespace App\Rules;

use App\Models\MetodoPago;
use App\Services\TipoVentaService;
use Closure;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Support\Facades\Log;
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

        foreach ($value as $index => $detalle_metodo) {
            if ($this->tipoVenta == 'AL CONTADO') {
                $metodo_pago = MetodoPago::find($detalle_metodo["metodo_pago_id"]);
                // monto
                if ($detalle_metodo['monto'] === "" || $detalle_metodo['monto'] === null) {
                    $fail("El monto del método de pago {$metodo_pago->nombre} es obligatorio.");
                }

                if (!is_numeric($detalle_metodo['monto']) || $detalle_metodo['monto'] <= 0) {
                    $fail("El monto del método de pago {$metodo_pago->nombre} no puede ser menor a 0.");
                }
            }
        }
    }
}
