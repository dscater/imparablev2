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
            $table->timestamps();
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
