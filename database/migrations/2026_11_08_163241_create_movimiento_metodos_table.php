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
        Schema::create('movimiento_metodos', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("movimiento_caja_id");
            $table->unsignedBigInteger("metodo_pago_id");
            $table->decimal("monto", 24, 2);
            $table->timestamps();

            $table->foreign("movimiento_caja_id")->on("movimiento_cajas")->references("id");
            $table->foreign("metodo_pago_id")->on("metodo_pagos")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('movimiento_metodos');
    }
};
