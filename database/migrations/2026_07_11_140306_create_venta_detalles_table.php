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
        Schema::create('venta_detalles', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("venta_id");
            $table->unsignedBigInteger("producto_id");
            $table->double("cantidad", 8, 2);
            $table->decimal("precio", 24, 2); // precio original(ingresado)
            $table->decimal("descuento_uni", 24, 2); // descuento unitario
            $table->double("porcen_du", 11, 7); // porcentaje descuento unitario
            $table->decimal("descuento_total", 24, 2); // descuento obtenido desde el descuento TOTAL de la venta
            $table->double("porcen_dt", 11, 7); // porcentaje descuento total
            $table->decimal("descuento_promocion", 24, 2)->default(0); // descuento obtenido desde el descuento TOTAL de la venta
            $table->double("porcen_promocion", 11, 7)->default(0); // porcentaje descuento total
            $table->decimal("tm_descuento_uni", 24, 2)->default(0); // total monto descontado x unidad
            $table->double("tp_descuento_uni", 11, 7)->default(0); // total porcentaje descontado x unidad
            $table->decimal("precio_uni", 24, 2); // precio uni (precio con descuentos) obtenido despues de descuento_uni + descuento_promocion
            $table->decimal("total_sd", 24, 2); // total sin descuento = cantidad * precio | para calcular ingreso bruto
            $table->decimal("total_uni", 24, 2); // total por fila sin tomar en cuenta descuento del total para mostrar = cantidad * (precio - descuento_uni)
            $table->decimal("desc_final_monto", 24, 2)->default(0); // descuento monto final (tm_descuento_uni + descuenti_total)
            $table->double("desc_final_porcentaje", 11, 7)->default(0); // descueto porcentaje final (tp_descuento_uni + porcen_dt)
            $table->decimal("precio_total", 24, 2); // precio total (precio_uni - descuento_total)
            $table->decimal("total", 24, 2); // total registrado = cantidad * precio_final | para calcular ingreso bruto
            $table->integer("status")->default(1);
            $table->timestamps();

            $table->foreign("venta_id")->on("ventas")->references("id");
            $table->foreign("producto_id")->on("productos")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('venta_detalles');
    }
};
