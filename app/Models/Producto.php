<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    use HasFactory;

    protected $fillable = [
        "codigo",
        "nombre",
        "tipo", // PRODUCTO, SERVICIO, PLAN (afecta el control de stock e inscripciones)
        "categoria_id",
        "marca_id",
        "unidad_medida_id",
        "caracteristicas",
        "precio",
        "precio_compra",
        "duracion_dias",
        "horario", // COMPLETO, MAÑANA, TARDE, NOCHE
        "hora_ini",
        "hora_fin",
        "indefinido", // 0: CALCULAR EL FIN DE LA INSCRIPCIÓN, 1: DESCONTAR DÍAS DE LA INSCRIPCIÓN
        "stock_min",
        "imagen",
        "activo",
        "fecha_registro",
    ];

    protected $appends = ["fecha_registro_t", "url_imagen"];

    public function getUrlImagenAttribute()
    {
        if ($this->imagen) {
            return asset("imgs/productos/" . $this->imagen);
        }
        return asset("imgs/productos/default.png");
    }

    public function getFechaRegistroTAttribute()
    {
        if ($this->fecha_registro) return date("d/m/Y", strtotime($this->fecha_registro));

        return "";
    }

    public function categoria()
    {
        return $this->belongsTo(Categoria::class, 'categoria_id');
    }

    public function marca()
    {
        return $this->belongsTo(Marca::class, 'marca_id');
    }

    public function unidad_medida()
    {
        return $this->belongsTo(UnidadMedida::class, 'unidad_medida_id');
    }

    public function kardex_productos()
    {
        return $this->hasMany(KardexProducto::class, 'producto_id');
    }
}
