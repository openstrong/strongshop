<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\Product;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\UserAddress;
use App\Repositories\RegionRepository;
use App\Models\Order\Order;
use App\Repositories\CartRepository;
use Illuminate\Support\Facades\DB;
use App\Repositories\OrderRepository;
use App\Repositories\AppRepository;
use App\Models\PaymentOption;
use Illuminate\Validation\Rule;
use App\Repositories\ShippingRepository;
use App\Events\CreatedOrder;
use Illuminate\Contracts\Auth\MustVerifyEmail;

class CheckoutController extends Controller
{

    public function showIndexForm(Request $request)
    {
        if ($request->user('web') instanceof MustVerifyEmail && !$request->user('web')->hasVerifiedEmail())
        {
            $request->session()->flash('status', __('Your email address is not verified. It is strongly recommended that you verify the email'));
        }

        $cart = CartRepository::getCart($request->buyNow);
        if (count($cart['rows']) < 1)
        {
            abort(201, __('Shopping Cart is empty.'));
        }
        //支付方式
        $payment_options = PaymentOption::where('status', 1)->get();
        //默认地址
        $default_address = UserAddress::where('user_id', $this->user->id)->where('is_default', 1)->first();
        if (!$default_address)
        {
            $default_address = Order::orderByDesc('id')
                    ->where('user_id', $this->user->id)
                    ->select('country_code', 'first_name', 'last_name', 'email', 'phone', 'fax', 'address_line_1', 'address_line_2', 'city', 'state_code', 'state_other', 'postal_code', 'billing_country_code', 'billing_first_name', 'billing_last_name', 'billing_email', 'billing_phone', 'billing_fax', 'billing_address_line_1', 'billing_address_line_2', 'billing_city', 'billing_state_code', 'billing_state_other', 'billing_postal_code')
                    ->first();
            if (!$default_address)
            {
                $default_address = new \stdClass();
                $default_address->country_code = $this->user->country_code;
                $default_address->first_name = $this->user->first_name;
                $default_address->last_name = $this->user->last_name;
                $default_address->email = $this->user->email;
            }
        }
        //国家
        $countries = RegionRepository::countries();
        //省
        $states = $default_address->country_code ? RegionRepository::states($default_address->country_code) : [];
        //配送方式
        $shipping_options = ShippingRepository::getShippingFeeList($cart['cart_weight'], $default_address->country_code);
        //本次订单可使用积分额度
        $use_credits_amount = intval($cart['total']['cart_total'] / 2);
        $viable_credits = CartRepository::getUsedCreditsByUseCreditsAmount($use_credits_amount);
        return view('shoppingcart.checkout', [
            'cart' => $cart,
            'shipping_options' => $shipping_options,
            'payment_options' => $payment_options,
            'default_address' => $default_address,
            'countries' => $countries,
            'states' => $states,
            'viable_credits' => $viable_credits,
        ]);
    }

    /**
     * 配送方式列表
     * @param Request $request
     * @return type
     */
    public function getShippingOptions(Request $request)
    {
        $rules = [
            'country_code' => ['required', 'string', 'max:255'],
            'state_code' => ['nullable', 'string', 'max:255'],
            'buyNow' => ['nullable', 'in:0,1'], //是否是立即购买
        ];
        $messages = [];
        $customAttributes = [];
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $cart = CartRepository::getCart($request->buyNow);
        $shipping_options = ShippingRepository::getShippingFeeList($cart['cart_weight'], $request->country_code);
        $content = (string) view('layouts.includes.shippingOptions', ['shipping_options' => $shipping_options]);
        return ['code' => 200, 'message' => __('Success'), 'data' => $shipping_options, 'content' => $content];
    }

    /**
     * 订单总计
     */
    public function orderTotal(Request $request)
    {
        $rules = [
            'country_code' => ['required', 'string', 'max:255'],
            'shipping_option_id' => ['required', 'integer', 'exists:shipping_option,id'],
            'payment_option_id' => ['required', 'integer', 'exists:payment_option,id'],
            'use_credits' => ['nullable', 'integer', 'gte:100'],
            'buyNow' => ['nullable', 'in:0,1'], //是否是立即购买
        ];
        $messages = [];
        $customAttributes = [];
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $cart = CartRepository::getCart($request->buyNow);
        $order_total = CartRepository::getOrderTotal($request, $cart);
        $data = $order_total;
        //订单结算货币
        $data['order_total_defaultCurrencyPay'] = $data['order_total'];
        if (config('strongshop.defaultCurrencyPay') !== AppRepository::getCurrentCurrency())
        {
            $data['order_total_defaultCurrencyPay'] = AppRepository::convertCurrencyToDefault($data['order_total']);
        }
        return ['code' => 200, 'message' => __('Success'), 'data' => $data];
    }

    /**
     * 创建订单
     * @param Request $request
     * @return type
     */
    public function createOrder(Request $request)
    {
        $rules = [
            'buyNow' => ['nullable', 'in:0,1'], //是否是立即购买
            //配送地址
            'first_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'email' => ['nullable', 'required', 'string', 'max:255'],
            'phone' => ['required', 'string', 'max:255'],
            'fax' => ['nullable', 'string', 'max:255'],
            'country_code' => ['required', 'string', 'max:255', Rule::in(collect(RegionRepository::countries())->keys())],
            'state_code' => ['required_without:state_other', 'nullable', 'string', 'max:255'],
            'state_other' => ['required_without:state_code', 'nullable', 'string', 'max:255'],
            'city' => ['required', 'string', 'max:255'],
            'address_line_1' => ['required', 'string', 'max:255'],
            'address_line_2' => ['nullable', 'string', 'max:255'],
            'postal_code' => ['required', 'string', 'max:255'],
            //账单地址
            'billing_first_name' => ['required', 'string', 'max:255'],
            'billing_last_name' => ['required', 'string', 'max:255'],
            'billing_email' => ['required', 'string', 'max:255'],
            'billing_phone' => ['required', 'string', 'max:255'],
            'billing_fax' => ['nullable', 'string', 'max:255'],
            'billing_country_code' => ['required', 'string', 'max:255'],
            'billing_state_code' => ['required_without:billing_state_other', 'nullable', 'string', 'max:255'],
            'billing_state_other' => ['required_without:billing_state_code', 'nullable', 'string', 'max:255'],
            'billing_city' => ['required', 'string', 'max:255'],
            'billing_address_line_1' => ['required', 'string', 'max:255'],
            'billing_address_line_2' => ['nullable', 'string', 'max:255'],
            'billing_postal_code' => ['required', 'string', 'max:255'],
            //积分
            'use_credits' => ['nullable', 'integer', 'gte:100', 'lte:' . $this->user->pay_credits],
            'shipping_option_id' => ['required', 'integer', Rule::exists('shipping_option_config', 'shipping_option_id')->where('status', 1)->where(function($query)use($request) {
                    return $query->whereJsonContains('countries', [$request->country_code]);
                })],
            'payment_option_id' => ['required', 'integer', Rule::exists('payment_option', 'id')->where('status', 1)],
            'remark' => ['nullable', 'string', 'max:255'],
        ];
        $messages = [];
        $customAttributes = [
            'state_code' => __('State/Province'),
            'state_other' => __('Other State/Province'),
        ];
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $order_data = $request->only(array_keys($rules));
        //购物车信息
        $cart = CartRepository::getCart($request->buyNow);
        if (count($cart['rows']) < 1)
        {
            return ['code' => 4001, 'message' => __('Shopping Cart is empty.')];
        }
        //本次订单可使用积分额度
        $use_credits_amount = intval($cart['total']['cart_total'] / 2);
        $viable_credits = CartRepository::getUsedCreditsByUseCreditsAmount($use_credits_amount);
        if ($request->use_credits > $viable_credits)
        {
            return ['code' => 4002, 'message' => __('The maximum credits for the order that you can use are <b>:viable_credits</b> credits.', ['viable_credits' => $viable_credits])];
        }
        //当前选择的货币
        $currency_code = AppRepository::getCurrentCurrency();
        //订单合计
        $order_total = CartRepository::getOrderTotal($request, $cart);
        //当前货币转换率
        $currency_rate = AppRepository::getCurrentCurrencyRate();
        //产品金额
        $products_amount = $order_total['cart_total'];
        //配送费用
        $shipping_fee = $order_total['shipping_fee'];
        //支付手续费
        $handling_fee = $order_total['handling_fee'];
        //税收费用
        $tax_fee = $order_total['tax_fee'];
        //订单金额，支付金额
        $order_amount = $order_total['order_total'];
        //使用积分金额
        $used_credits_amount = $order_total['used_credits_amount'];
        //折扣金额
        $discount_amount = 0;

        /**
         * 生成订单
         */
        $orderModel = new Order();
        $orderModel->fill($order_data);
        $orderModel->user_id = $this->user->id;
        $orderModel->order_no = OrderRepository::generateOrderNo();
        $orderModel->currency_code = $currency_code;
        $orderModel->currency_rate = $currency_rate;
        $orderModel->weight_total = $cart['cart_weight']; //产品总重
        $orderModel->products_amount = $products_amount; //产品金额
        $orderModel->shipping_fee = $shipping_fee; //配送费用
        $orderModel->handling_fee = $handling_fee; //支付手续费
        $orderModel->tax_fee = $tax_fee; //税收费用
        $orderModel->order_amount = $order_amount; //订单金额，支付金额
        $orderModel->paid_amount = 0;
        $orderModel->used_credits_amount = $used_credits_amount; //积分金额
        $orderModel->discount_amount = $discount_amount; //折扣金额
        $orderModel->order_status = Order::STATUS_UNPAID; //订单状态
        $orderModel->shipping_option_id = $request->shipping_option_id;
        $orderModel->payment_option_id = $request->payment_option_id;
        $orderModel->remark = (string) $request->remark;

        DB::transaction(function ()use($orderModel, $cart, $request) {
            $orderModel->save();
            //订单产品
            foreach ($cart['rows'] as $cartRow)
            {
                $specs = [];
                foreach ($cartRow['product']['specs'] as $spec)
                {
                    $specs[] = [
                        'name' => $spec['name'],
                        'value' => $spec['pivot']['spec_value']
                    ];
                }
                $orderProducts[] = [
                    'order_id' => $orderModel->id,
                    'product_id' => $cartRow['product']['id'],
                    'title' => $cartRow['product']['title'],
                    'sku' => $cartRow['product']['sku'],
                    'weight' => $cartRow['product']['weight'],
                    'currency_code' => $orderModel->currency_code,
                    'currency_rate' => $orderModel->currency_rate,
                    'original_price' => $cartRow['product']['original_price'],
                    'sale_price' => $cartRow['product_price_now'],
                    'img_cover' => $cartRow['product']['img_cover'],
                    'specs' => json_encode($specs),
                    'qty' => $cartRow['qty'],
                    'created_at' => now(),
                ];
            }
            DB::table('order_product')->insert($orderProducts);
            //清空购物车
            CartRepository::clearCart($request->buyNow);
        }, 2);

        //触发`下单成功`事件
        event(new CreatedOrder($orderModel));

        //支付方式
        $payment = PaymentOption::find($request->payment_option_id);

        $url = route("payment.pay", ['paycode' => $payment->code, 'orderId' => $orderModel->id]);

        return ['code' => 200, 'message' => __('Success'), 'data' => [
                'toUrl' => $url,
                'orderId' => $orderModel->id,
        ]];
        //return redirect($url);
    }

}
