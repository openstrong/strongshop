<?php

use Illuminate\Contracts\Routing\UrlGenerator;

/**
 * 重写url方法
 *
 * @param  string|null  $path
 * @param  mixed  $parameters
 * @param  bool|null  $secure
 * @return \Illuminate\Contracts\Routing\UrlGenerator|string
 */
function urlHelper($path = null, $parameters = [], $secure = null)
{
    if (is_null($path))
    {
        return app(UrlGenerator::class);
    }
    $pre = request()->route()->getPrefix();
    if ($pre)
    {
        $path = '/' . $pre . '/' . trim($path, '/');
    }
    app(UrlGenerator::class)->forceRootUrl(config('app.url'));
    return app(UrlGenerator::class)->to($path, $parameters, $secure);
}

/**
 * Generate the URL to a named route.
 *
 * @param  array|string  $name
 * @param  mixed  $parameters
 * @param  bool  $absolute
 * @return string
 */
function routeHelper($name, $parameters = [], $absolute = true)
{
    $route = app('url')->route($name, $parameters, false);
    if ($absolute)
    {
        return urlHelper($route);
    }
    $pre = request()->route()->getPrefix();
    if ($pre)
    {
        $route = '/' . $pre . '/' . trim($route, '/');
    }
    return $route;
}

/**
 * 设置环境变量值
 * @param array $data
 */
function setEnv(array $data)
{
    if (empty($data))
    {
        return false;
    }
    $changed = false;
    $str = '';
    foreach ($_ENV as $k => $v)
    {
        if (!isset($data[$k]) || !$data[$k])
        {
            $str .= "{$k}=\"{$v}\"\r\n";
            continue;
        }
        $str .= "{$k}=\"{$data[$k]}\"\r\n";
        $_ENV[$k] = $data[$k];
        $changed = true;
    }
    if ($changed === false)
    {
        return false;
    }
    file_put_contents(base_path('.env'), $str);
    return true;
}
