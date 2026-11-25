<?php

namespace App\Http\Controllers;

use App\Services\ListCondicionService;
use Illuminate\Http\Request;

class ListCondicionController extends Controller
{
    public function __construct(private ListCondicionService $list_condicion_service) {}
    public function listado()
    {
        return response()->JSON([
            "list_condicions" => $this->list_condicion_service->listado()
        ]);
    }
}
