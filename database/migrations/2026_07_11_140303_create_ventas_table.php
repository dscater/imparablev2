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
        Schema::create('ventas', function (Blueprint $table) {
            $table->id();
            $table->string("codigo_venta")->nullable();
            $table->unsignedBigInteger("sucursal_id");
            $table->unsignedBigInteger("cliente_id");
            $table->string("nit_ci")->nullable();
            $table->string("tipo_venta"); //CRÉDITO, AL CONTADO
            $table->unsignedBigInteger("metodo_pago_id");
            $table->decimal("subtotal", 24, 2);
            $table->decimal("descuento", 24, 2);
            $table->double("porcentaje_descuento", 8, 2);
            $table->decimal("total", 24, 2);
            $table->decimal("saldo", 24, 2);
            $table->date("fecha");
            $table->time("hora");
            $table->date("fecha_registro")->nullable();
            $table->integer("status")->default(1);
            $table->unsignedBigInteger("user_id")->nullable();
            $table->timestamps();

            $table->foreign("sucursal_id")->on("sucursals")->references("id");
            $table->foreign("cliente_id")->on("clientes")->references("id");
            $table->foreign("metodo_pago_id")->on("metodo_pagos")->references("id");
            $table->foreign("user_id")->on("users")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ventas');
    }
};
