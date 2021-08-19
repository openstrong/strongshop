<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Repositories;

use App\Models\Product\Category;
use App\Repositories\AppRepository;

class ProductRepository
{

    public static function getCategories()
    {
        $model = Category::query();
        $model->orderBy('sort', 'DESC');
        $model->where('type', 1)->where('status', 1)->where('level', 1);
        $model->with(['children' => function($query) {
                $query->orderBy('sort', 'DESC');
                $query->where('status', 1);
                $query->select('id', 'parent_id', 'name');
                $query->with(['children' => function($query) {
                        $query->orderBy('sort', 'DESC');
                        $query->where('status', 1);
                        $query->select('id', 'parent_id', 'name');
                    }]);
            }]);
        $rows = $model->select('id', 'name')->get();
        return $rows;
    }

    public static function getFilterPrices(float $min, float $max)
    {
        $currency = AppRepository::getCurrentCurrency();
        $rate = AppRepository::getCurrentCurrencyRate();

        $min = round($min * $rate);
        $max = round($max * $rate);

        $i = ceil($max / 5);

        $prices = [];
        $m = $n = $min;
        while ($n < $max)
        {
            $n += $i;
            $prices[] = [
                'min' => round($m / $rate),
                'minLabel' => $currency . ' ' . $m,
                'max' => round($n / $rate),
                'maxLabel' => $currency . ' ' . $n,
            ];
            $m += $i;
        }
        return $prices;
    }

}
