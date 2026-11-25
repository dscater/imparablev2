<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Promocion extends Model
{
    protected $fillable = [
        "nombre",
        "descripcion",
        "tipo", //TODOS, PRODUCTO, SERVICIO, PLAN
        "condicion", // NORMAL, CUMPLEANERO
        "indefinido", // 0: fecha inicio y fin, 1: solo fecha inicio
        "fecha_ini",
        "fecha_fin",
        "cantidad",
        "porcentaje_monto", // PORCENTAJE, MONTO
        "porcentaje",
        "monto",
        "fecha_registro",
        "user_id",
        "estado", // 0: INACTIVO, 1: ACTIVO
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
