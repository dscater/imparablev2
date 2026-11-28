<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class IngresoMetodo extends Model
{
    protected $fillable = [
        "ingreso_producto_id",
        "metodo_pago_id",
        "monto",
    ];

    public function ingreso_producto()
    {
        return $this->belongsTo(IngresoProducto::class, 'ingreso_producto_id');
    }

    public function metodo_pago()
    {
        return $this->belongsTo(MetodoPago::class, 'metodo_pago_id');
    }
}
