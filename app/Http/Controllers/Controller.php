<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use App\Repositories\Traits\AppTrait;

class Controller extends BaseController
{

    use AuthorizesRequests,
        DispatchesJobs,
        ValidatesRequests;
    use AppTrait;

    /**
     * 渲染错误
     * @param int $code
     * @param string $message
     * @param array $data
     */
    protected function renderError(int $code, string $message, array $data = [])
    {
        if ($this->isApi)
        {
            return ['code' => $code, 'message' => $message, 'data' => $data];
        } elseif ($this->isWeb)
        {
            abort(201, $message);
        } else
        {
            abort(201, $message);
        }
    }

}
