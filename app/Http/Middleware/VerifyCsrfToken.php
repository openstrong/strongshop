<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;
use Closure;

class VerifyCsrfToken extends Middleware
{

    /**
     * Indicates whether the XSRF-TOKEN cookie should be set on the response.
     *
     * @var bool
     */
    protected $addHttpCookie = true;

    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array
     */
    protected $except = [
        'payment/*',
    ];

    /**
     * 应该从CSRF验证中排除的 UserAgent。
     * @var type
     */
    private $exceptUserAgent = [
        'PostmanRuntime', //Postman
    ];

    public function handle($request, Closure $next)
    {
        if (\App::environment(['local', 'testing']))
        {
            foreach ($this->exceptUserAgent as $agent)
            {
                if (strpos($request->userAgent(), $agent) !== false)
                {
                    return $next($request);
                }
            }
        }
        return parent::handle($request, $next);
    }

}
