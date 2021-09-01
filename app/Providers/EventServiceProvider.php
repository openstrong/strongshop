<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Events\Login;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use App\Events\CreatedOrder;
use App\Events\OrderShipped;
use App\Events\OrderClosed;

class EventServiceProvider extends ServiceProvider
{

    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        //注册成功
        Registered::class => [
            \App\Listeners\User\SendRegisteredNotification::class, //发送`注册成功`通知和验证邮件
            \App\Listeners\User\UserSourceRecord::class, //记录用户来源
        ],
        //登录成功
        Login::class => [
            \App\Listeners\UpdateShoppingCart::class, //更新购物车
        ],
        //重置密码成功
        PasswordReset::class => [
        ],
        //下单成功
        CreatedOrder::class => [
            \App\Listeners\Order\OrderSourceRecord::class, //记录订单来源
        ],
        //订单发货
        OrderShipped::class => [
            \App\Listeners\Order\SendOrderShippedNotification::class, //发送通知
            \App\Listeners\Order\IncrementProductSaleNum::class, //累计产品销量和减库存
        ],
        //订单关闭
        OrderClosed::class => [
            \App\Listeners\Order\SendOrderClosedNotification::class, //发送通知
        ],
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        parent::boot();

        //
    }

}
