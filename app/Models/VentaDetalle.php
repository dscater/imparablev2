<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class VentaDetalle extends Model
{
    protected $fillable = [
        "venta_id",
        "producto_id",
        "cantidad",
        "precio", // precio original(ingresado)
        "descuento_uni", // descuento unitario
        "porcen_du", // porcentaje descuento unitario
        "descuento_promocion", // descuento promocion
        "porcen_promocion", // porcentaje descuento promocion
        "descuento_total", // descuento obtenido desde el descuento TOTAL de la venta
        "porcen_dt", // porcentaje descuento total
        "precio_final", // precio final (precio con descuentos) obtenido despues de los descuentos (precio - descuento_uni)
        "total_sd", // total sin descuento = cantidad * precio | para calcular ingreso bruto
        "total", // total registrado = cantidad * precio_final | para calcular ingreso bruto
        "total_uni", // total por fila sin tomar en cuenta descuento del total para mostrar = cantidad * precio_final
        "status",
    ];

    protected $appends = ["tm_descuento_uni", "tp_descuento_uni"];

    public function getTMDescuentoUniAttribute()
    {
        // TOTAL DESCUENTO UNI + PROMOCION
        return $this->descuento_uni ?? 0 + $this->this->descuento_promocion ?? 0;
    }

    public function getTPDescuentoUniAttribute()
    {
        // PORCENTAJE TOTAL DESCUENTO UNI + PROMOCION
        return $this->porcen_du ?? 0 + $this->porcen_promocion ?? 0;
    }

    public function venta()
    {
        return $this->belongsTo(Venta::class, 'venta_id');
    }

    public function producto()
    {
        return $this->belongsTo(Producto::class, 'producto_id');
    }

    public function detalle_promocions()
    {
        return $this->hasMany(DetallePromocion::class, 'venta_detalle_id');
    }

    public function venta_lotes()
    {
        return $this->hasMany(VentaLote::class, 'venta_detalle_id');
    }

    public function inscripcions()
    {
        return $this->hasMany(Inscripcion::class, 'venta_detalle_id');
    }
}
