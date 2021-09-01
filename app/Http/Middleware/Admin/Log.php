<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Middleware\Admin;

use Closure;
use App\Models\Admin\AdminLog;

class Log
{

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $response = $next($request);
        try {
            if (!($response instanceof \Illuminate\Http\JsonResponse))
            {
                return $response;
            }
            $response_data = $response->getData(true);
            if (!isset($response_data['code']))
            {
                return $response;
            }
            if (!isset($response_data['log']) || $response_data['log'] === '')
            {
                return $response;
            }
            $this->write($request, $response_data);
        } catch (\Exception $exception) {
            return $response;
        }
        return $response;
    }

    protected function write($request, $response_data)
    {
        $model = new AdminLog();
        $model->route_url = $request->getRequestUri();
        $model->desc = $response_data['log'] ?? '';
        if (isset($response_data['logDirty']) && !empty($response_data['logDirty']))
        {
            $model->log_dirty = $response_data['logDirty'];
            if (isset($response_data['logOriginal']) && !empty($response_data['logOriginal']))
            {
                $model->log_original = collect($response_data['logOriginal'])->only(collect($response_data['logDirty'])->keys());
            }
        }
        $model->admin_user_id = $request->user('admin')->id ?? 0;
        $model->save();
        return true;
    }

}
