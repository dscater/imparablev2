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
        "tm_descuento_uni", // total monto descontado x unidad
        "tp_descuento_uni", // total porcentaje descontado x unidad
        "descuento_total", // descuento obtenido desde el descuento TOTAL de la venta
        "porcen_dt", // porcentaje descuento total
        "precio_uni", // precio uni (precio con descuentos) obtenido despues de descuento_uni + descuento_promocion
        "precio_total", // precio total (precio_uni - descuento_total)
        "total_sd", // total sin descuento = cantidad * precio | para calcular ingreso bruto
        "total_uni", // total por fila sin tomar en cuenta descuento del total para mostrar = cantidad * precio_uni
        "desc_final_monto", // descuento monto final (tm_descuento_uni + descuenti_total)
        "desc_final_porcentaje", // descueto porcentaje final (tp_descuento_uni + porcen_dt)
        "costo_total", // costo del lote para la utilidad bruta
        "total", // total registrado = cantidad * precio_total | para calcular ingreso bruto
        "status",
    ];

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
