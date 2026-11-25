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
        Schema::create('detalle_promocions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("venta_detalle_id");
            $table->unsignedBigInteger("promocion_id");
            $table->string("porcentaje_monto"); // PORCENTAJE, MONTO
            $table->double("porcentaje", 8, 2)->nullable();
            $table->decimal("monto", 24, 2)->nullable();
            $table->timestamps();

            $table->foreign("venta_detalle_id")->references("id")->on("venta_detalles");
            $table->foreign("promocion_id")->references("id")->on("promocions");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('detalle_promocions');
    }
};
