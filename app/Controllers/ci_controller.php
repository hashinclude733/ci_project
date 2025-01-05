<?php

namespace App\Controllers;

class ci_controller extends BaseController
{
    public function index(): string
    {
        return view('test');
    }
}