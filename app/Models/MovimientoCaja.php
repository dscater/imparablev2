<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MovimientoCaja extends Model
{
    protected $fillable = [
        "sucursal_id",
        "tipo",
        "modulo",
        "registro_id",
        "monto_total",
        "tipo_movimiento", //INGRESO-EGRESO
        "descripcion",
        "fecha",
        "hora",
        "user_id",
        "status", // 1: activo, 0: eliminado
    ];

    protected $appends = ["fecha_t", "fecha_hora_t"];

    public function getFechaHoraTAttribute()
    {
        return date("d/m/Y H:i:s", strtotime($this->fecha . " " . $this->hora));
    }

    public function getFechaTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha));
    }

    public function sucursal()
    {
        return $this->belongsTo(Sucursal::class, 'sucursal_id');
    }

    public function movimiento_metodos()
    {
        return $this->hasMany(MovimientoMetodo::class, 'movimiento_caja_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
