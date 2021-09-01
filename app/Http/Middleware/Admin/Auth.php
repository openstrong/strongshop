<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Middleware\Admin;

use Closure;
use Illuminate\Support\Facades\Route;

class Auth
{

    //忽略检测的路由
    public $ignore_auth_url = ['admin/login', 'admin/logout', 'admin/captcha'];

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (in_array(Route::current()->uri, $this->getIgnoreUrl()))
        {
            return $next($request);
        }
        if (!auth()->guard('admin')->check())
        {
            return redirect('/admin/login');
            //return response()->json(['code' => 401, 'msg' => '请登录']);
        }
        return $next($request);
    }

    protected function getIgnoreUrl()
    {
        return $this->ignore_auth_url;
    }

}
