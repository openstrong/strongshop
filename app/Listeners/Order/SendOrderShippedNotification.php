<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Listeners\Order;

use App\Events\OrderShipped;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class SendOrderShippedNotification
{

    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  OrderShipped  $event
     * @return void
     */
    public function handle(OrderShipped $event)
    {
        if (!app('strongshop')->getShopConfig('notice_email_shipped_order'))
        {
            return false;
        }
        $order = $event->order;
        $user = \App\Models\User::find($order->user_id);
        $user->notify(new \App\Notifications\Order\OrderShippedNotification($order));
    }

}
