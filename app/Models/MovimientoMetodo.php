<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MovimientoMetodo extends Model
{
    protected $fillable = [
        "movimiento_caja_id",
        "metodo_pago_id",
        "monto",
    ];

    public function movimiento_caja()
    {
        return $this->belongsTo(MovimientoCaja::class, 'movimiento_caja_id');
    }

    public function metodo_pgo()
    {
        return $this->belongsTo(MetodoPago::class, 'metodo_pgo_id');
    }
}
