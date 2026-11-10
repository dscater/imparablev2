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
        Schema::create('disciplina_plans', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("disciplina_id");
            $table->unsignedBigInteger("producto_id");
            $table->timestamps();

            $table->foreign("disciplina_id")->on("disciplinas")->references("id");
            $table->foreign("producto_id")->on("productos")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('disciplina_plans');
    }
};
