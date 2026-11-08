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
        Schema::create('plans', function (Blueprint $table) {
            $table->id();
            $table->string("nombre");
            $table->double("precio", 24, 2);
            $table->integer("dias");
            $table->string("tipo"); //NORMAL: calcular dias, ASISTENCIA: se van descontando los días
            $table->string("turno"); // DIA, TARDE, NOCHE, TODOS
            $table->text("descripcion");
            $table->string("imagen")->nullable();
            $table->date("fecha_registro");
            $table->unsignedBigInteger("user_id");
            $table->timestamps();

            $table->foreign("user_id")->references("id")->on("users");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('plans');
    }
};
