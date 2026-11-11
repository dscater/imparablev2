<?php

namespace Database\Seeders;

use App\Models\Sucursal;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SucursalTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Sucursal::create([
            "nombre" => "SUCURSAL 1",
            "fono" => "SUCURSAL 1",
            "dir" => "ZONA LOS PEDREGALES",
            "fecha_registro" => date("Y-m-d"),
        ]);
        Sucursal::create([
            "nombre" => "SUCURSAL 2",
            "fono" => "SUCURSAL 2",
            "dir" => "ZONA LOS PEDREGALES",
            "fecha_registro" => date("Y-m-d"),
        ]);
        Sucursal::create([
            "nombre" => "SUCURSAL 3",
            "fono" => "SUCURSAL 3",
            "dir" => "ZONA LOS PEDREGALES",
            "fecha_registro" => date("Y-m-d"),
        ]);
    }
}
