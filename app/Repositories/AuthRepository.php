<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Repositories;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;
use App\Repositories\UuidRepository;
use Illuminate\Support\Facades\Cache;

class AuthRepository
{

    const CODE_KEY = 'login:code:';

    public static function setCode($username, $code)
    {
        Cache::put(self::CODE_KEY . $username, $code, now()->addMinutes(5));
    }

    public static function getCode($username)
    {
        return Cache::pull(self::CODE_KEY . $username);
    }

}
