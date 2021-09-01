<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\Common;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Region\RegionCountry;
use App\Repositories\RegionRepository;

class RegionController extends Controller
{

    public function states(Request $request)
    {
        $rows = RegionRepository::states($request->country_code);
        return ['code' => 200, 'message' => __('Success'), 'data' => $rows];
    }

}
