<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Middleware\Web;

use Closure;
use Illuminate\Support\Facades\View;
use Illuminate\Pagination\Paginator;
use App\Repositories\AppRepository;
use App\Repositories\ProductRepository;
use App\Repositories\CartRepository;
use App\Repositories\ShippingRepository;
use App\Repositories\RegionRepository;

class ViewShare
{

    /**
     * The URIs that should be excluded.
     *
     * @var array
     */
    protected $except = [
        'payment/paypal/return',
        'user/order/tracking',
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
        if (!$request->isMethod('get') && !$this->inExceptArray($request))
        {
//            return $next($request);
        }
        $user_id = app('strongshop')->user->id ?? null;
        //\Illuminate\Support\Facades\View::addLocation(resource_path('views'));
        //分页视图
        Paginator::defaultView('vendor.pagination.default');
        Paginator::defaultSimpleView('vendor.pagination.simple-default');

        //商店配置
        //View::share('_STRONGSHOP_CONFIG', AppRepository::getShopConfig());
        //语言
        View::share('_languages', AppRepository::getLanguages());
        //货币
        View::share('_currencies', AppRepository::getCurrencies()); //货币列表
        View::share('_current_currency', AppRepository::getCurrentCurrency()); //当前货币code
        View::share('_current_currency_name', AppRepository::getCurrentCurrencyName()); //当前货币名称
        //产品分类
        View::share('_categories', ProductRepository::getCategories());
        //购物车
        View::share('_cart', $this->getCart());
        //产品收藏总数
        View::share('_wish_list_total', \DB::table('user_collect')->where('user_id', $user_id)->count());
        //未读反馈回复
        View::share('_unread_feedback_replies_total', \DB::table('user_feedback')->where('user_id', $user_id)->where('status', 2)->whereNull('read_at')->count() ?: '');

        return $next($request);
    }

    private function getCart()
    {
        $cart = CartRepository::getCart();
        if (config('strongshop.showShipingFeeInCart'))
        {
            if ((isset(app('strongshop')->user->country_code) && app('strongshop')->user->country_code))
            {
                $_user_country_code = app('strongshop')->user->country_code; //会员所属国家code
            } else
            {
                $_user_country_code = config('strongshop.defaultCountry'); //默认国家code
            }
            //显示配送费用
            $shipping_fee_list = ShippingRepository::getShippingFeeList($cart['cart_weight'], $_user_country_code);
            $shipping_total = $shipping_fee_list[0]['fee'] ?? 0;
            View::share('_countries', RegionRepository::countries()); //国家列表
            View::share('_user_country_code', $_user_country_code); //会员所属国家code
            View::share('_shipping_options', $shipping_fee_list); //配送方式列表
        } else
        {
            $shipping_total = false; // false 表示不显示配送费用
        }
        $cart['total']['shipping_total'] = $shipping_total;
        return $cart;
    }

    protected function inExceptArray($request)
    {
        foreach ($this->except as $except)
        {
            if ($except !== '/')
            {
                $except = trim($except, '/');
            }

            if ($request->fullUrlIs($except) || $request->is($except))
            {
                return true;
            }
        }

        return false;
    }

}
