<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('productos', function (Blueprint $table) {
            $table->id();
            $table->string("codigo", 255)->unique();
            $table->string("nombre", 255);
            $table->string("tipo"); // PRODUCTO, SERVICIO, PLAN (afecta el control de stock e inscripciones)
            $table->unsignedBigInteger("categoria_id")->nullable();
            $table->unsignedBigInteger("marca_id")->nullable();
            $table->unsignedBigInteger("unidad_medida_id")->nullable();
            $table->text("caracteristicas")->nullable();
            $table->decimal("precio", 24, 2);
            $table->decimal("precio_compra", 24, 2)->nullable();
            $table->integer("duracion_dias")->nullable();
            $table->string("horario")->nullable(); // COMPLETO, MAÑANA, TARDE, NOCHE
            $table->time("hora_ini")->nullable();
            $table->time("hora_fin")->nullable();
            $table->boolean("indefinido")->nullable(); // 0: CALCULAR EL FIN DE LA INSCRIPCIÓN, 1: DESCONTAR DÍAS DE LA INSCRIPCIÓN
            $table->double("stock_min", 8, 2)->nullable();
            $table->string("imagen", 255)->nullable();
            $table->boolean("activo")->default(1);
            $table->date("fecha_registro");
            $table->timestamps();

            $table->foreign("categoria_id")->on("categorias")->references("id");
            $table->foreign("marca_id")->on("marcas")->references("id");
            $table->foreign("unidad_medida_id")->on("unidad_medidas")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('productos');
    }
};
