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
        Schema::create('clientes', function (Blueprint $table) {
            $table->id();
            $table->string("nombre", 255);
            $table->string("paterno", 255);
            $table->string("materno", 255)->nullable();
            $table->string("ci");
            $table->string("ci_exp");
            $table->date("fecha_nac");
            $table->string("dir")->nullable();
            $table->string("fono", 155)->nullable();
            $table->string("nom_ref")->nullable();
            $table->string("fono_ref", 155)->nullable();
            $table->string("correo")->nullable();
            $table->string('foto', 255)->nullable();
            $table->unsignedBigInteger("user_id")->nullable();
            $table->date("fecha_registro")->nullable();
            $table->integer("status")->default(1);
            $table->timestamps();

            $table->foreign("user_id")->on("users")->references("id");
            $table->unique(["ci", "ci_exp"], "clientes_ci_ci_exp_unique");
            $table->index(["status", "ci"], "clientes_status_ci_index");
            $table->index(["status", "paterno"], "clientes_status_paterno_index");
            $table->index(["status", "fecha_registro"], "clientes_status_fecha_registro_index");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('clientes');
    }
};
