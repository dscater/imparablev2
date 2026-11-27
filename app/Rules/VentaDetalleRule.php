<?php

namespace App\Rules;

use App\Models\Producto;
use Closure;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Translation\PotentiallyTranslatedString;

class VentaDetalleRule implements ValidationRule
{
    /**
     * Run the validation rule.
     *
     * @param  Closure(string, ?string=): PotentiallyTranslatedString  $fail
     */
    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        if (!is_array($value)) {
            $fail('Debes ingresar al menos 1 producto');
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

            if ($detalle["producto"]["tipo"] == 'PLAN') {
                $producto_plan = Producto::find($detalle["producto_id"]);
                if ($producto_plan->duracion_dias > 1) {
                    // validar beneficiarios
                    foreach ($detalle["inscripcions"] as $inscripcion) {
                        // cliente
                        if ($inscripcion['cliente_id'] === "" || $inscripcion['cliente_id'] === null) {
                            $fail("Debes asignar el/los beneficiario(s) del concepto {$producto_plan->nombre}");
                        }
                        if ($inscripcion['fecha_inicio'] === "" || $inscripcion['fecha_inicio'] === null) {
                            $fail("Debes indicar la fecha de inicio del concepto {$producto_plan->nombre}");
                        }
                    }
                }
            }
        }
    }
}
