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
        Schema::create('plan_disciplinas', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("plan_id");
            $table->unsignedBigInteger("disciplina_id");
            $table->timestamps();

            $table->foreign("plan_id")->on("plans")->references("id");
            $table->foreign("disciplina_id")->on("disciplinas")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('plan_disciplinas');
    }
};
