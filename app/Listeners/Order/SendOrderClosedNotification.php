<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Listeners\Order;

use App\Events\OrderClosed;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class SendOrderClosedNotification
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
     * @param  OrderClosed  $event
     * @return void
     */
    public function handle(OrderClosed $event)
    {
        if (!app('strongshop')->getShopConfig('notice_email_closed_order'))
        {
            return false;
        }
        $order = $event->order;
        $user = \App\Models\User::find($order->user_id);
        $user->notify(new \App\Notifications\Order\OrderClosedNotification($order));
    }

}
