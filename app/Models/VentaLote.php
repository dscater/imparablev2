<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class VentaLote extends Model
{
    protected $fillable = [
        "venta_id",
        "venta_detalle_id",
        "ingreso_detalle_id",
        "cantidad",
    ];

    public function venta()
    {
        return $this->belongsTo(Venta::class, 'venta_id');
    }

    public function venta_detalle()
    {
        return $this->belongsTo(VentaDetalle::class, 'venta_detalle_id');
    }

    public function ingreso_detalle()
    {
        return $this->belongsTo(IngresoDetalle::class, 'ingreso_detalle_id');
    }
}
