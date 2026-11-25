<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Inscripcion extends Model
{
    protected $fillable = [
        "sucursal_id",
        "user_cliente_id",
        "cliente_id",
        "producto_id",
        "venta_detalle_id",
        "declaracion_jurada", // SI LA EDAD DEL INSCRITO ES MENOR A 18 AÑOS
        "fecha_inicio",
        "estado", //0: INACTIVO, 1:ACTIVO, 2: PAUSADO
        "fecha_pausa",
        "dias_pausa",
        "justificacion_pausa",
        "dias_restantes",
        "fecha_fin",
        "fecha",
        "hora",
        "user_id",
        "user_pausa_id",
    ];

    public function sucursal()
    {
        return $this->belongsTo(Sucursal::class, 'sucursal_id');
    }

    public function user_cliente()
    {
        return $this->belongsTo(User::class, 'user_cliente_id');
    }

    public function cliente()
    {
        return $this->belongsTo(Cliente::class, 'cliente_id');
    }

    public function producto()
    {
        return $this->belongsTo(Producto::class, 'producto_id');
    }

    public function venta_detalle()
    {
        return $this->belongsTo(VentaDetalle::class, 'venta_detalle_id');
    }
}
