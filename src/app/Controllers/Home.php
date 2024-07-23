<?php

namespace App\Controllers;

class Home extends BaseController
{
    public function index(): string
    {
        return view('welcome_message');
    }

    public function teste(): string
    {
        return "TESTE ROTA";
    }

    public function param($dd): string
    {
        return "TESTE ROTA PARAM :::: $dd";
    }

}
