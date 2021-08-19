<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Listeners\Order;

use App\Events\CreatedOrder;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class OrderSourceRecord
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
     * @param  CreatedOrder  $event
     * @return void
     */
    public function handle(CreatedOrder $event)
    {
        $http_referer = session()->get('http_referer');
        $source = session()->get('source');
        if ($http_referer)
        {
            $event->order->http_referer = $http_referer;
        }
        if ($source)
        {
            $event->order->source = $source;
        }
        $event->order->save();
    }
}
