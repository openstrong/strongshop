<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product\Product;
use App\Repositories\AppRepository;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Cache;

class HomeController extends Controller
{

    public function index()
    {
        $data = Cache::get('product:home');
        if (!$data)
        {
            //New Products
            $newRows = Product::query()
                            ->where('status', 1)->where('is_new', 1)
                            ->select(['id', 'title', 'stock', 'stock_status', 'original_price', 'sale_price', 'img_cover', 'click_num'])
                            ->limit(12)->get();
            //Hot Products
            $hotRows = Product::query()
                            ->where('status', 1)->where('is_hot', 1)
                            ->select(['id', 'title', 'stock', 'stock_status', 'original_price', 'sale_price', 'img_cover', 'click_num'])
                            ->limit(12)->get();
            //Recommend Products
            $recommendRows = Product::query()
                            ->where('status', 1)->where('is_recommend', 1)
                            ->select(['id', 'title', 'stock', 'stock_status', 'original_price', 'sale_price', 'img_cover', 'click_num'])
                            ->limit(12)->get();

            $data = [
                'newRows' => $newRows, 'hotRows' => $hotRows, 'recommendRows' => $recommendRows,
            ];
            Cache::put('product:home', $data, now()->tomorrow());
        }

        View::share('_meta_keywords', AppRepository::getShopConfig('meta_keywords'));
        View::share('_meta_description', AppRepository::getShopConfig('meta_description'));
        return view('home', $data);
    }

    public function test(Request $request)
    {
        return view('test');
    }

}
