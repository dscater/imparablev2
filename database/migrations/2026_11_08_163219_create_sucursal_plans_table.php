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
        Schema::create('sucursal_plans', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("sucursal_id");
            $table->unsignedBigInteger("plan_id");
            $table->timestamps();

            $table->foreign("sucursal_id")->references("id")->on("sucursals")->onDelete("cascade");
            $table->foreign("plan_id")->references("id")->on("plans")->onDelete("cascade");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sucursal_plans');
    }
};
