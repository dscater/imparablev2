<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('usuario')->unique();
            $table->string('codigo')->unique()->nullable();
            $table->string("nombre");
            $table->string("paterno");
            $table->string("materno")->nullable();
            $table->string("ci");
            $table->string("ci_exp");
            $table->string('password', 255);
            $table->string('correo', 255)->nullable();
            $table->string('foto', 255)->nullable();
            $table->string('tipo'); //ADMINISTRACIÓN, EMPLEADO, CLIENTE
            $table->unsignedBigInteger("role_id")->nullable();
            $table->unsignedBigInteger('sucursal_id')->nullable();
            $table->integer('sucursal_todos')->default(0);
            $table->date('fecha_registro');
            $table->integer("acceso")->default(1);
            $table->integer("status")->default(1);
            $table->timestamps();

            $table->foreign("sucursal_id")->on("sucursals")->references("id");
            $table->foreign("role_id")->on("roles")->references("id");
            $table->unique(["ci", "ci_exp"], "ci_ci_exp_unique");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
