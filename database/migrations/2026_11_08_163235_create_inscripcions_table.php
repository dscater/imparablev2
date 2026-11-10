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
        Schema::create('inscripcions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("sucursal_id");
            $table->unsignedBigInteger("user_cliente_id");
            $table->unsignedBigInteger("cliente_id");
            $table->unsignedBigInteger("producto_id");
            $table->unsignedBigInteger("venta_detalle_id");
            $table->string("declaracion_jurada")->nullable();
            $table->date("fecha_inicio");
            $table->integer("estado")->default(1); //0: INACTIVO, 1:ACTIVO, 2: PAUSADO
            $table->date("fecha_pausa")->nullable();
            $table->integer("dias_pausa")->nullable();
            $table->text("justificacion_pausa")->nullable();
            $table->integer("dias_restantes");
            $table->date("fecha_fin")->nullable();
            $table->date("fecha");
            $table->time("hora");
            $table->unsignedBigInteger("user_id");
            $table->unsignedBigInteger("user_pausa_id")->nullable();
            $table->timestamps();

            $table->foreign("sucursal_id")->on("sucursals")->references("id");
            $table->foreign("user_cliente_id")->on("users")->references("id");
            $table->foreign("cliente_id")->on("clientes")->references("id");
            $table->foreign("producto_id")->on("productos")->references("id");
            $table->foreign("venta_detalle_id")->on("venta_detalles")->references("id");
            $table->foreign("user_id")->on("users")->references("id");
            $table->foreign("user_pausa_id")->on("users")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('inscripcions');
    }
};
