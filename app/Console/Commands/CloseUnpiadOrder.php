<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Order\Order;

class CloseUnpiadOrder extends Command
{

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'order:close';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '关闭超时(24h)未支付订单';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        Order::query()
                ->orderByDesc('id')
                ->where('order_status', Order::STATUS_UNPAID)
                ->where('created_at', '<', now()->subDay(1))
                ->chunk(50, function($rows) {
                    foreach ($rows as $row)
                    {
                        $row->order_status = Order::STATUS_CLOSED;
                        $row->canceled_at = now();
                        $row->save();
                        //触发`订单关闭`事件
                        event(new \App\Events\OrderClosed($row));
                        $this->info("Closed and Sent notification:{$row->order_no}");
                    }
                });
        $this->info('Done.');
    }

}
