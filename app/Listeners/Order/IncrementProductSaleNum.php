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

class IncrementProductSaleNum
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
     * 累计产品销量和减库存
     *
     * @param  OrderShipped  $event
     * @return void
     */
    public function handle(OrderShipped $event)
    {
        $order = $event->order;
        foreach ($order->orderProducts as $orderProduct)
        {
            \DB::transaction(function()use($orderProduct) {
                \DB::table('product')->where('id', $orderProduct->product_id)->increment('sale_num', $orderProduct->qty);
                \DB::table('product')->where('id', $orderProduct->product_id)->decrement('stock', $orderProduct->qty);
            });
        }
    }

}
