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
        Schema::create('promocions', function (Blueprint $table) {
            $table->id();
            $table->string("nombre");
            $table->text("descripcion");
            $table->string("tipo"); //TODOS, PRODUCTO, SERVICIO, PLAN
            $table->boolean("indefinido"); // 0: fecha inicio y fin, 1: solo fecha inicio
            $table->date("fecha_ini")->nullable();
            $table->date("fecha_fin")->nullable();
            $table->integer("cantidad")->nullable();
            $table->string("porcentaje_monto"); // PORCENTAJE, MONTO
            $table->double("porcentaje", 8, 2)->nullable();
            $table->decimal("monto", 24, 2)->nullable();
            $table->date("fecha_registro");
            $table->unsignedBigInteger("user_id");
            $table->integer("estado")->default(1); // 0: INACTIVO, 1: ACTIVO
            $table->timestamps();

            $table->foreign("user_id")->references("id")->on("users");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('promocions');
    }
};
