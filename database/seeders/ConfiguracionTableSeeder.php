<?php

namespace Database\Seeders;

use App\Models\Configuracion;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ConfiguracionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Configuracion::create([
            "nombre_sistema" => "IMPARABLE V2",
            "alias" => "IMPARABLE",
            "razon_social" => "IMPARABLE S.A.",
            "nit" => "11111111111",
            "ciudad" => "LA PAZ - BOLIVIA",
            "dir" => "LOS PEDREGALES #223",
            "fono" => "2323232 - 7776666",
            "actividad" => "ACTIVIDAD EMPRESA",
            "correo" => "imparable@gmail.com",
            "logo" => "logo.png"
        ]);
    }
}
