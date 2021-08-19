<?php

namespace App\Http\Middleware;

use Closure;

class EnableCrossRequestMiddleware
{

    protected $except = [
        'api/wechat/serve',
        'api/pay/notify/*',
    ];

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

        foreach ($this->except as $except)
        {
            if ($except !== '/')
            {
                $except = trim($except, '/');
            }
            if ($request->fullUrlIs($except) || $request->is($except))
            {
                return $response;
            }
        }

        if (!method_exists($response, 'header'))
        {
            return $response;
        }

        $origin = $request->server('HTTP_ORIGIN') ? $request->server('HTTP_ORIGIN') : 'http://localhost:8080';
        $response->header('Access-Control-Allow-Origin', $origin);
        $response->header('Access-Control-Allow-Headers', 'Origin, Content-Type, Cookie, X-CSRF-TOKEN, Accept, Authorization, X-XSRF-TOKEN');
        $response->header('Access-Control-Expose-Headers', 'Authorization, authenticated');
        $response->header('Access-Control-Allow-Methods', 'GET, POST, PATCH, PUT, OPTIONS, DELETE, HEAD');
        $response->header('Access-Control-Allow-Credentials', 'true');

        return $response;
    }

}
