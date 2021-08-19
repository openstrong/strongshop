<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Repositories;

use App\Repositories\AppRepository;
use App\Models\Product\ShoppingCart;
use App\Models\PaymentOption;
use Illuminate\Http\Request;
use App\Repositories\ShippingRepository;
use App\Repositories\OrderRepository;

class CartRepository
{

    /**
     * 购物车信息 [产品列表/价格统计/配送费用]
     * @param type $buyNow 立即购买
     * @return type
     */
    public static function getCart($buyNow = false)
    {
        //产品金额
        $cart_amount = 0;
        //产品总重量：克
        $cart_weight = 0;
        //产品数量
        $cart_qty_total = 0;

        $model = ShoppingCart::query();
        $model->orderByDesc('id');
        $model->whereHas('product');
        $model->with([
            'product' => function($query) {
                $query->select('id', 'title', 'sku', 'img_cover', 'original_price', 'sale_price', 'stock', 'stock_status', 'wholesale_set', 'weight');
                $query->with([
                    'specs' => function($query) {
                        $query->select('id', 'name');
                        $query->where('product_spec.spec_type', 1);
                    }
                ]);
            }
        ]);
        if (AppRepository::getUser())
        {
            $model->where('user_id', AppRepository::getUser()->id);
        } else
        {
            $model->where('uuid', app('strongshop')->uuid);
        }
        if ($buyNow)
        {
            $model->where('is_buy_now', 1);
        } else
        {
            $model->where('is_buy_now', 0);
        }
        $rows = $model->get();
        foreach ($rows as $row)
        {
            $cart_amount += $row->qty * $row->product_price_now; // `product_price_now` 此字段价格是按当前汇率转换后的金额
            $cart_weight += $row->qty * $row->product->weight;
        }
        //产品数量
        $cart_qty_total = (int) $rows->count();

        //产品小计
        $cart_total = AppRepository::dedimalTruncate($cart_amount);

        $total = [
            'cart_qty_total' => $cart_qty_total, //购物车产品数量
            'cart_total' => $cart_total, //产品小计
        ];

        $data = [
            'total' => $total,
            'cart_weight' => $cart_weight, //产品总重量
            'rows' => $rows->toArray(),
        ];
        return $data;
    }

    /**
     * 清空购物车
     * @param type $buyNow 立即购买
     */
    public static function clearCart($buyNow = false)
    {
        $model = ShoppingCart::query();
        if (AppRepository::getUser())
        {
            $model->where('user_id', AppRepository::getUser()->id);
        } else
        {
            $model->where('uuid', app('strongshop')->uuid);
        }
        if ($buyNow)
        {
            $model->where('is_buy_now', 1);
        } else
        {
            $model->where('is_buy_now', 0);
        }
        $model->delete();
    }

    /**
     * 购物车产品信息
     * @param type $id 购物车id
     * @param type $where
     */
    public static function getProduct(int $id, array $where = null)
    {
        $model = ShoppingCart::where('id', $id);
        $model->with([
            'product' => function($query) {
                $query->select('id', 'title', 'sku', 'img_cover', 'original_price', 'sale_price', 'stock', 'stock_status', 'wholesale_set');
                $query->with([
                    'specs' => function($query) {
                        $query->select('id', 'name');
                        $query->where('product_spec.spec_type', 1);
                    }
                ]);
            }
        ]);
        if (!empty($where))
        {
            $model->where($where);
        }
        $row = $model->first();
        $row->product_url = route('product.show', ['id' => $row->product_id]);
        return $row;
    }

    /**
     * 订单合计
     * @param Request $request
     * @param $cart 购物车信息
     * @return type
     */
    public static function getOrderTotal(Request $request, $cart = null)
    {
        //购物车信息
        if ($cart === null)
        {
            $cart = CartRepository::getCart();
        }

        //购物车商品小计
        $cart_total = $cart['total']['cart_total'];

        //配送费用
        $shipping_fee = ShippingRepository::getShippingFee($cart['cart_weight'], $request->shipping_option_id, $request->country_code);

        //使用积分金额
        if (app('strongshop')->getShopConfig('use_credits'))
        {
            $used_credits_amount = self::getUsedCreditsAmountByUseCredits(intval($request->use_credits));
        } else
        {
            $used_credits_amount = 0;
        }

        //订单金额 [购物车产品金额 + 配送费用 - 积分金额]
        $order_amount = $cart_total + $shipping_fee - $used_credits_amount;

        //支付手续费用
        $payment = PaymentOption::find($request->payment_option_id);
        $rate = $payment->more['rate'] ?? 0;
        $handling_fee = 0;
        if (strpos($rate, '%') !== false)
        {
            // 按照比例收取支付手续费用
            $val = floatval($rate) / 100;
            $handling_fee = $val > 0 ? $order_amount * $val / (1 - $val) : 0;
        } else
        {
            $handling_fee = $rate;
        }
        if ($handling_fee > 0)
        {
            $handling_fee = AppRepository::convertCurrency($handling_fee);
            $order_amount += $handling_fee;
        }

        //税收费用
        $tax_fee = RegionRepository::getTaxFee($order_amount, $request->country_code);

        $order_total = $order_amount + $tax_fee; //最终订单金额（支付金额）

        $data['shipping_fee'] = $shipping_fee;
        $data['handling_fee'] = $handling_fee;
        $data['tax_fee'] = $tax_fee;
        $data['used_credits_amount'] = $used_credits_amount;
        $data['cart_total'] = $cart_total;
        $data['order_total'] = AppRepository::dedimalTruncate($order_total);
        return $data;
    }

    /**
     * 通过积分获取积分金额（积分 =》 钱）
     * @param type $use_credits
     */
    public static function getUsedCreditsAmountByUseCredits(int $use_credits)
    {
        $amount = round($use_credits / 100, config('strongshop.defaultDedimal'));
        return AppRepository::convertCurrency($amount);
    }

    /**
     * 通过积分金额获取积分（钱 =》 积分）
     * @param type $use_credits_amount
     */
    public static function getUsedCreditsByUseCreditsAmount(float $use_credits_amount)
    {
        $amount = AppRepository::convertCurrencyToDefault($use_credits_amount);
        $use_credits = intval($amount) * 100;
        return $use_credits;
    }

}
