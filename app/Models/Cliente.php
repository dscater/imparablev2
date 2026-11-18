<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;

class Cliente extends Model
{
    use HasFactory;

    protected $fillable = [
        "nombre",
        "paterno",
        "materno",
        "ci",
        "ci_exp",
        "fecha_nac",
        "dir",
        "fono",
        "nom_ref",
        "parentesco_ref",
        "fono_ref",
        "correo",
        "foto",
        "user_id",
        "fecha_registro",
        "status",
    ];

    protected $appends = ["url_foto", "fecha_registro_t", "full_ci", "full_name"];

    public function getFullNameAttribute()
    {
        return $this->nombre . ' ' . $this->paterno . ' ' . $this->materno;
    }

    public function getFullCiAttribute()
    {
        return $this->ci . ' ' . $this->ci_exp;
    }

    public function getFechaRegistroTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_registro));
    }

    public function getUrlFotoAttribute()
    {
        if ($this->foto) {
            return asset("imgs/clientes/" . $this->foto);
        }
        return asset("imgs/clientes/default.png");
    }

    public function scopeBuscarNombre($query, $texto)
    {
        if (!$texto) return $query;

        $palabras = explode(' ', $texto);

        foreach ($palabras as $palabra) {
            $query->where(function ($q) use ($palabra) {
                $q->where('nombre', 'like', "%$palabra%")
                    ->orWhere('nro_documento', 'like', "%$palabra%");
            });
        }

        return $query;
    }

    public function tipo_documento()
    {
        return $this->belongsTo(TipoDocumento::class, 'tipo_documento_id');
    }
}
