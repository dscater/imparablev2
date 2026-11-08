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
        Schema::create('promocions', function (Blueprint $table) {
            $table->id();
            $table->string("nombre");
            $table->text("descripcion");
            $table->string("tipo"); // POR FECHAS, INDEFINIDO, POR INSCRIPCIONES
            $table->date("fecha_ini")->nullable(); // por fechas
            $table->date("fecha_fin")->nullable(); // por fechas
            $table->integer("inscripciones")->nullable(); // por inscripciones
            $table->date("fecha_regitro");
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
        Schema::dropIfExists('promocions');
    }
};
