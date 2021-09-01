<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Auth\AuthenticationException;

class Authenticate extends Middleware
{

    public function handle($request, Closure $next, ...$guards)
    {
        if ($this->authenticate($request, $guards) === false)
        {
            return response()->json(['code' => 401, 'message' => __('Please sign in')]);
        }
        return $next($request);
    }

    protected function authenticate($request, array $guards)
    {
        if (empty($guards))
        {
            $guards = [null];
        }

        foreach ($guards as $guard)
        {
            if ($this->auth->guard($guard)->check())
            {
                return $this->auth->shouldUse($guard);
            }
        }

        return $this->unauthenticated($request, $guards);
    }

    protected function unauthenticated($request, array $guards)
    {
        if ($request->expectsJson() || array_search('api', $guards) !== false)
        {
            return false;
        }
        throw new AuthenticationException(
                        'Unauthenticated.', $guards, $this->redirectTo($request)
        );
    }

    /**
     * Get the path the user should be redirected to when they are not authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string|null
     */
    protected function redirectTo($request)
    {
        return route('login');
    }

}
