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
            $table->unsignedBigInteger("cliente_id");
            $table->unsignedBigInteger("plan_id");
            $table->unsignedBigInteger("promocion_id")->nullable();
            $table->decimal("total", 24, 2);
            $table->decimal("descuento", 24, 2)->nullable();
            $table->double("porcentaje_descuento")->nullable();
            $table->decimal("cancelado", 24, 2);
            $table->decimal("saldo", 24, 2);
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

            $table->foreign("cliente_id")->on("clientes")->references("id");
            $table->foreign("plan_id")->on("plans")->references("id");
            $table->foreign("promocion_id")->on("promocions")->references("id");
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
