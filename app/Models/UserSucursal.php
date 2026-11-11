<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserSucursal extends Model
{
    protected $fillable = [
        "user_id",
        "sucursal_id",
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function sucursal()
    {
        return $this->belongsTo(Sucursal::class, 'sucursal_id');
    }
}
