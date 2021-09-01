<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Repositories;

use App\Repositories\AppRepository;
use App\Models\Order\Order;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;

class OrderRepository
{

    /**
     * 生成订单编号
     */
    public static function generateOrderNo()
    {
        mt_srand((double) microtime() * 1000000);
        $str = 'ST';
        $str .= date('YmdHi') . str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT);
        return $str;
    }

    /**
     * 设置订单为已支付（成功支付）
     * @param type $order_no
     * @param type $transaction_id
     * @param type $paid_amount
     * @return type
     */
    public static function paid($order_no, $transaction_id, $paid_amount = null)
    {
        $order = Order::where('order_no', $order_no)->first();
        if (!$order)
        {
            if (config('app.debug') || env('PAYMENT_LOG'))
            {
                Log::debug('paypal notify $order_no,$transaction_id,$paid_amount: ', [$order_no, $transaction_id, $paid_amount]);
            }
            return false;
        }
        if ($paid_amount === null)
        {
            $paid_amount = $order->order_amount;
        }
        $order->order_status = Order::STATUS_PAID;
        $order->paid_amount = $paid_amount;
        $order->transaction_id = $transaction_id;
        $order->paid_at = now();
        return $order->save();
    }

    /**
     * 支付异常
     * @param type $order_no
     * @param type $desc
     * @return boolean
     */
    public static function exception($order_no, $desc = '支付异常')
    {
        $order = Order::where('order_no', $order_no)->first();
        if (!in_array($order->order_status, [Order::STATUS_UNPAID]))
        {
            return true;
        }
        $order->order_status = Order::STATUS_PAY_EXCEPTION;
        $order->pay_remark = $desc;
        return $order->save();
    }

    /**
     * 设置订单为（支付失败）
     * @param type $order_no
     * @param type $desc
     * @return type
     */
    public static function failed($order_no, $desc = '')
    {
        $order = Order::where('order_no', $order_no)->first();
        if (!in_array($order->order_status, [Order::STATUS_UNPAID]))
        {
            return true;
        }
        $order->order_status = Order::STATUS_PAY_FAILED;
        $order->transaction_id = $desc;
        return $order->save();
    }

}
