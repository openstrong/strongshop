<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Middleware\Common;

use Closure;
use App\Repositories\AppRepository;

class Uuid
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
        $uuid = app('strongshop')->getUuid();
        return $next($request)->header('uuid', $uuid)->cookie('uuid', $uuid, 60 * 24 * 365);
    }

}
