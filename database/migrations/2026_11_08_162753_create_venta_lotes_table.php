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
        Schema::create('venta_lotes', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("venta_id");
            $table->unsignedBigInteger("venta_detalle_id");
            $table->unsignedBigInteger("ingreso_detalle_id");
            $table->double("cantidad", 8, 2);
            $table->decimal("costo_unitario", 24, 2);
            $table->decimal("costo_total", 24, 2);
            $table->timestamps();

            $table->foreign("venta_id")->on("ventas")->references("id");
            $table->foreign("venta_detalle_id")->on("venta_detalles")->references("id");
            $table->foreign("ingreso_detalle_id")->on("ingreso_detalles")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('venta_lotes');
    }
};
