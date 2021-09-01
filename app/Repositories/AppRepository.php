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
use App\Models\Admin\WebConfig;

class AppRepository
{

    public $uuid = null;

    /**
     * 是否是`api`路由组
     * @return bool
     */
    public static function isApi(): bool
    {
        $guard = self::getGuard();
        return $guard === 'api' ? true : false;
    }

    /**
     * 是否是`web`路由组
     * @return bool
     */
    public static function isWeb(): bool
    {
        $guard = self::getGuard();
        return $guard === 'web' ? true : false;
    }

    /**
     * 获取语言
     */
    public static function getLanguages($key = null)
    {
        $datas = config('strongshop.langs');
        if ($key)
        {
            $datas = Arr::get($datas, $key);
        }
        return $datas;
    }

    /**
     * 当前语言 code
     * @return type
     */
    public static function getCurrentLanguage()
    {
        $route_prefix = request()->route() ? request()->route()->getPrefix() : null;
        $code = null;
        if (self::isWeb() && $route_prefix)
        {
            $route_prefix = Str::before($route_prefix, '/');
            $code = $route_prefix;
        }
        if (!$code)
        {
            $code = request('locale', request()->header('locale')) ?: request()->cookie('locale', config('strongshop.defaultLanguage'));
        }
        if (!$code || !self::getLanguages($code))
        {
            $code = config('strongshop.defaultLanguage');
        }
        return $code;
    }

    /**
     * 当前语言名称
     * @return type
     */
    public static function getCurrentLanguageName()
    {
        $data = self::getCurrentLanguage();
        return self::getLanguages("{$data}.name");
    }

    /**
     * 获取货币
     */
    public static function getCurrencies($key = null)
    {
        $datas = config('strongshop.currencies');
        if ($key)
        {
            $datas = Arr::get($datas, $key);
        }
        return $datas;
    }

    /**
     * 当前货币 code
     * @return type
     */
    public static function getCurrentCurrency()
    {
        $currency = request('currency', request()->header('currency')) ?: request()->cookie('currency');
        if (!$currency || !self::getCurrencies($currency))
        {
            $currency = config('strongshop.defaultCurrency');
        }
        return $currency;
    }

    /**
     * 当前货币 name
     * @return type
     */
    public static function getCurrentCurrencyName()
    {
        $currency = self::getCurrentCurrency();
        return config("strongshop.currencies.{$currency}.name");
    }

    /**
     * 当前货币 费率
     * @return type
     */
    public static function getCurrentCurrencyRate()
    {
        $data = self::getCurrentCurrency();
        $rate = self::getCurrencies("{$data}.rate");
        return $rate;
    }

    /**
     * 默认货币按照费率转换成选择的货币
     * @param type $price
     * @return type
     */
    public static function convertCurrency($price, $currency_code = null)
    {
        if ($currency_code)
        {
            $rate = self::getCurrencies("{$currency_code}.rate");
        } else
        {
            $rate = self::getCurrentCurrencyRate();
        }
        $number = $rate * $price;
        return self::dedimalTruncate($number);
    }

    /**
     * 按照费率转换成默认货币
     * @param type $price
     * @param type $rate 税率
     * @return type
     */
    public static function convertCurrencyToDefault($price, $rate = null)
    {
        if (!$rate)
        {
            $rate = self::getCurrentCurrencyRate();
        }
        $number = $price / $rate;
        return self::dedimalTruncate($number);
    }

    /**
     * 保留小数位数
     * @param type $number
     * @return type
     */
    public static function dedimalTruncate($number)
    {
        $defaultDedimal = config('strongshop.defaultDedimal');
        if ($defaultDedimal < 0)
        {
            $defaultDedimal = 0;
        }
        $number = round($number, $defaultDedimal, PHP_ROUND_HALF_UP);
        return sprintf("%.{$defaultDedimal}f", $number);
    }

    /**
     * 获取登录用户信息
     * @return type
     */
    public static function getUser()
    {
        $guard = self::getGuard();
        return Auth::guard($guard)->check() ? Auth::guard($guard)->user() : null;
    }

    /**
     * 获取登录守护名称
     * @return string
     */
    public static function getGuard()
    {
        if (!request()->route())
        {
            return null;
        }
        $data = request()->route()->getAction('middleware') ?: [];
        if (is_string($data))
        {
            $data = [$data];
        }
        if (array_search('api', $data) !== false)
        {
            return 'api';
        } elseif (array_search('web', $data) !== false)
        {
            return 'web';
        } else
        {
            return $data[0] ?? null;
        }
    }

    /**
     * 获取 uuid
     */
    public function getUuid()
    {
        $uuid = request()->header('uuid', request()->cookie('uuid'));
        $this->uuid = $uuid;
        if (!$uuid)
        {
            $this->uuid = (string) Str::uuid();
        }
        return $this->uuid;
    }

    /**
     * 获取网站配置
     * @param type $key 键名
     * @return string
     */
    public static function getShopConfig($key)
    {
        $datas = cache('webconfig');
        if (!$datas)
        {
            $rows = WebConfig::query()->get();
            $datas = [];
            foreach ($rows as $row)
            {
                $datas[$row->key] = $row->value;
            }
            cache(['webconfig' => $datas]);
        }
        return $datas[$key] ?? '';
    }

    /**
     * 修改配置信息
     */
    public static function changeConfig()
    {
        //判断是否运行在命令行下
        if (app()->runningInConsole())
        {
            return false;
        }
        $MAIL_HOST = self::getShopConfig('MAIL_HOST');
        $MAIL_PORT = self::getShopConfig('MAIL_PORT');
        $MAIL_USERNAME = self::getShopConfig('MAIL_USERNAME');
        $MAIL_PASSWORD = self::getShopConfig('MAIL_PASSWORD');
        $MAIL_ENCRYPTION = self::getShopConfig('MAIL_ENCRYPTION');
        $MAIL_REPLYTO_ADDRESS = self::getShopConfig('MAIL_REPLYTO_ADDRESS');
        $MAIL_REPLYTO_NAME = self::getShopConfig('MAIL_REPLYTO_NAME');

        config(['mail.host' => $MAIL_HOST]);
        config(['mail.port' => $MAIL_PORT]);
        config(['mail.username' => $MAIL_USERNAME]);
        config(['mail.password' => $MAIL_PASSWORD]);
        config(['mail.encryption' => $MAIL_ENCRYPTION]);
        config(['mail.reply_to.address' => $MAIL_REPLYTO_ADDRESS]);
        config(['mail.reply_to.name' => $MAIL_REPLYTO_NAME]);

        return true;
    }

    /**
     * 魔术方法
     * @param type $name
     * @return type
     */
    public function __get($name)
    {
        $action = 'get' . ucfirst($name);
        return $this->$action();
    }

}
