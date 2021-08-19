<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

/**
 * 来源记录
 */

namespace App\Http\Middleware\Web;

use Closure;

class SourceRecord
{

    public $except = ['www.paypal.com'];

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $referer_host = parse_url($request->server('HTTP_REFERER'))['host'] ?? null; //全局 `SERVER` 变量 HTTP_REFERER
        $http_host = $request->server('HTTP_HOST'); //当前host
        $source = trim($request->get('source', $request->from)); //自定义来源
        if ($referer_host === $http_host)
        {
            return $next($request);
        }
        if (in_array($referer_host, $this->except))
        {
            return $next($request);
        }
        if ($referer_host)
        {
            session(['http_referer' => $referer_host]);
        }
        if ($source)
        {
            session(['source' => $source]);
        }
        return $next($request);
    }

}
