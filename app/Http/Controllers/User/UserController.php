<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product\Product;
use App\Models\Order\Order;
use App\Repositories\RegionRepository;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{

    public function index()
    {
        return view('user.index');
    }

    public function account()
    {
        $user = $this->user;
        //国家
        $countries = RegionRepository::countries();
        return view('user.account', ['user' => $user, 'countries' => $countries]);
    }

    public function update(Request $request)
    {
        $rules = [
            'first_name' => ['nullable', 'string', 'min:1', 'max:100'],
            'last_name' => ['nullable', 'string', 'min:1', 'max:100'],
            'country_code' => ['nullable', 'string', 'min:1', 'max:100', Rule::in(collect(RegionRepository::countries())->keys())],
            'birthday' => ['nullable', 'date'],
            'gender' => ['nullable', 'in:0,1,2'],
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $user = $this->user;
        if ($request->first_name)
        {
            $user->first_name = $request->first_name;
        }
        if ($request->last_name)
        {
            $user->last_name = $request->last_name;
        }
        if ($request->country_code)
        {
            $user->country_code = $request->country_code;
        }
        if ($request->birthday)
        {
            $user->birthday = $request->birthday;
        }
        $user->gender = $request->gender;
        $user->save();
        return ['code' => 200, 'message' => __('Success')];
    }

    public function resendEmailVerification()
    {
        $user = $this->user;
        if ($user->hasVerifiedEmail())
        {
            return ['code' => 4001, 'message' => __('Email Verified')];
        }
        $user->sendEmailVerificationNotification();
        return ['code' => 200, 'message' => __('Validated mail sent successfully. If you have not received it, please check your spam folder.')];
    }

    public function collects()
    {
        $rows = Product::query()
                ->orderByDesc('user_collect.created_at')
                ->select('product.id', 'product.sku', 'product.title', 'product.sale_price', 'product.img_cover', 'user_collect.created_at as collect_at')
                ->rightJoin('user_collect', 'product.id', '=', 'user_collect.product_id')
                ->where('user_collect.user_id', $this->user->id)
                ->paginate();
        return view('user.collects', ['rows' => $rows]);
    }

    public function removeCollects(Request $request)
    {
        $rules = [
            'product_id' => ['required', 'integer'],
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $res = \DB::table('user_collect')->where('product_id', $request->product_id)->where('user_id', $this->user->id)->delete();
        if ($res)
        {
            return ['code' => 200, 'message' => __('Success')];
        }
        return ['code' => 5001, 'message' => __('Server internal error')];
    }

    public function orders()
    {
        $rows = Order::query()
                ->orderByDesc('id')
                ->where('user_id', $this->user->id)
                ->select('id', 'order_no', 'currency_code', 'order_amount', 'order_status', 'created_at', 'payment_option_id')
                ->with('orderProducts:product_id,order_id,sku,title,sale_price,qty,img_cover,specs')
                ->with('paymentOption:id,code')
                ->paginate(5);
        return view('user.orders', ['rows' => $rows]);
    }

    public function orderDetail($orderId)
    {
        $row = Order::query()
                ->where('user_id', $this->user->id)
                ->where('id', $orderId)
                ->with('orderProducts:product_id,order_id,sku,title,sale_price,qty,img_cover,specs')
                ->with('shippingOption:id,title')
                ->with('paymentOption:id,title,code,desc')
                ->first();
        return view('user.orderDetail', ['row' => $row]);
    }

    public function orderTracking(Request $request)
    {
        if ($request->isMethod('post'))
        {
            $rules = [
                'order_no' => ['required', 'string', Rule::exists('order', 'order_no')->whereNull('deleted_at')],
            ];
            $validator = Validator::make($request->all(), $rules);
        } else
        {
            $validator = null;
        }

        $row = Order::query()
                ->where('order_no', $request->order_no)
                ->first();
        return view('user.orderTracking', ['row' => $row])->withErrors($validator);
    }

    public function cancelOrder(Request $request)
    {
        $rules = [
            'order_id' => ['required', 'integer', Rule::exists('order', 'id')->where('user_id', $this->user->id)->where('order_status', Order::STATUS_UNPAID)->whereNull('deleted_at')],
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = Order::find($request->order_id);
        $model->order_status = Order::STATUS_CANCELED;
        $model->canceled_at = now();
        $model->save();
        return ['code' => 200, 'message' => __('Success')];
    }

    public function receiveOrder(Request $request)
    {
        $rules = [
            'order_id' => ['required', 'integer', Rule::exists('order', 'id')->where('user_id', $this->user->id)->where('order_status', Order::STATUS_SHIPPED)->whereNull('deleted_at')],
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = Order::find($request->order_id);
        $model->order_status = Order::STATUS_RECEIVED;
        $model->received_at = now();
        $model->save();
        return ['code' => 200, 'message' => __('Success')];
    }

}
