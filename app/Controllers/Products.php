<?php

namespace App\Controllers;


use App\Models\ProductModel;


class Products extends BaseController
{
   
    public function index()
    {
        //new branch commit
       
       
        $model = new ProductModel();
       
        $data['products'] = $model->findAll();
        return view('products', $data);
       
    }
}
