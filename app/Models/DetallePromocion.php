<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DetallePromocion extends Model
{
    protected $fillable = [
        "venta_detalle_id",
        "promocion_id",
        "porcentaje_monto", // PORCENTAJE, MONTO
        "porcentaje",
        "monto",
    ];

    public function venta_detalle()
    {
        return $this->belongsTo(VentaDetalle::class, 'venta_detalle_id');
    }

    public function promocion()
    {
        return $this->belongsTo(Promocion::class, 'promocion_id');
    }
}
