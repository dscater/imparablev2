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
        Schema::create('producto_promocions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("producto_id");
            $table->unsignedBigInteger("promocion_id");
            $table->date("fecha_registro");
            $table->unsignedBigInteger("user_id");
            $table->timestamps();

            $table->foreign("producto_id")->on("productos")->references("id");
            $table->foreign("promocion_id")->on("promocions")->references("id");
            $table->foreign("user_id")->on("users")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('producto_promocions');
    }
};
