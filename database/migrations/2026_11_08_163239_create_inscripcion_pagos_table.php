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
        Schema::create('inscripcion_pagos', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("inscripcion_id");
            $table->unsignedBigInteger("metodo_pago_id");
            $table->decimal("monto", 24, 2);
            $table->date("fecha");
            $table->time("hora");
            $table->unsignedBigInteger("user_id");
            $table->timestamps();

            $table->foreign("inscripcion_id")->on("inscripcions")->references("id");
            $table->foreign("metodo_pago_id")->on("metodo_pagos")->references("id");
            $table->foreign("user_id")->on("users")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('inscripcion_pagos');
    }
};
