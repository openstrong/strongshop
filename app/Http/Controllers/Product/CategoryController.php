<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\Product;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\ProductRepository;

class CategoryController extends Controller
{

    public function index()
    {
        $rows = ProductRepository::getCategories();
        return ['code' => 200, 'message' => 'Success', 'data' => $rows];
    }

}
