<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Admin\BaseController;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Carbon;
use App\Models\Order\Order;
use App\Models\Order\OrderProduct;
use App\Models\ShippingOption;
use App\Models\PaymentOption;

class OrderController extends BaseController
{

    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Order\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, Order $order)
    {
        if (!$request->expectsJson())
        {
            $order_status = $order->getOrderStatus();
            return $this->view('order.index', ['model' => $order, 'order_status' => $order_status]);
        }
        $model = Order::orderBy(($request->field ?: 'id'), ($request->order ?: 'desc'));
        $model->with('buyer:id,email,first_name,last_name');
        $model->with('shippingOption:id,title');
        $model->with('paymentOption:id,title');
        if ($request->id)
        {
            $model->where('id', $request->id);
        }
        if ($request->user_id)
        {
            $model->whereHas('buyer', function($query)use($request) {
                $query->where('email', $request->user_id);
            });
        }
        if ($request->order_no)
        {
            $model->where('order_no', 'like', "%{$request->order_no}%");
        }
        if ($request->currency_code)
        {
            $model->where('currency_code', 'like', "%{$request->currency_code}%");
        }
        if ($request->order_status)
        {
            $model->where('order_status', $request->order_status);
        }
        if ($request->pay_remark)
        {
            $model->where('pay_remark', 'like', "%{$request->pay_remark}%");
        }
        if ($request->shipping_option_id)
        {
            $model->where('shipping_option_id', $request->shipping_option_id);
        }
        if ($request->payment_option_id)
        {
            $model->where('payment_option_id', $request->payment_option_id);
        }
        if ($request->transaction_id)
        {
            $model->where('transaction_id', 'like', "%{$request->transaction_id}%");
        }
        if ($request->remark)
        {
            $model->where('remark', 'like', "%{$request->remark}%");
        }
        if ($request->first_name)
        {
            $model->where('first_name', 'like', "%{$request->first_name}%");
        }
        if ($request->last_name)
        {
            $model->where('last_name', 'like', "%{$request->last_name}%");
        }
        if ($request->email)
        {
            $model->where('email', 'like', "%{$request->email}%");
        }
        if ($request->phone)
        {
            $model->where('phone', 'like', "%{$request->phone}%");
        }
        if ($request->fax)
        {
            $model->where('fax', 'like', "%{$request->fax}%");
        }
        if ($request->country_code)
        {
            $model->where('country_code', 'like', "%{$request->country_code}%");
        }
        if ($request->state_code)
        {
            $model->where('state_code', 'like', "%{$request->state_code}%");
        }
        if ($request->state_other)
        {
            $model->where('state_other', 'like', "%{$request->state_other}%");
        }
        if ($request->city)
        {
            $model->where('city', 'like', "%{$request->city}%");
        }
        if ($request->postal_code)
        {
            $model->where('postal_code', 'like', "%{$request->postal_code}%");
        }
        if ($request->created_at_begin && $request->created_at_end)
        {
            $model->whereBetween('created_at', [$request->created_at_begin, Carbon::parse($request->created_at_end)->endOfDay()]);
        }
        if ((isset($request->page) && $request->page <= 0) || $request->export)
        {
            $rows = $model->get();
        } else
        {
            $rows = $model->paginate($request->limit);
        }
        //$rows->makeHidden(['deleted_at']);
        return ['code' => 200, 'message' => __('admin.Success'), 'data' => $rows];
    }

    /**
     * Display the specified resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, OrderProduct $orderProductModel)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required', 'integer', Rule::exists('order')],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = Order::query();
        $model->with('orderProducts');
        $model->with('buyer:id,email,first_name,last_name');
        $model->with('shippingOption:id,title');
        $model->with('paymentOption:id,title');
        $row = $model->find($request->id);
        return $this->view('order.show', ['model' => $row, 'orderProductModel' => $orderProductModel]);
    }

    /**
     * Store a newly created resource in storage.
     * 
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Order\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, Order $order)
    {
        if (!$request->expectsJson())
        {
            return $this->view('order.form', ['model' => $order]);
        }
        $rules = array_merge_recursive($order->rules(), [
        ]);
        $messages = $order->messages();
        $customAttributes = $order->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $order->fill($request->all());
        if ($order->save())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessCreated'),
                'data' => $order,
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessCreated'), $order->tableComments, $order->id)
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Order\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Order $order)
    {
        if (!$request->expectsJson())
        {
            $model = $order::find($request->id);
            //配送方式
            $shipping_options = ShippingOption::where('status', 1)->get();
            //支付方式
            $payment_options = PaymentOption::where('status', 1)->get();
            return $this->view('order.form',
                            [
                                'model' => $model,
                                'shipping_options' => $shipping_options,
                                'payment_options' => $payment_options,
                            ]
            );
        }
        $rules = array_merge_recursive($order->rules(), [
            'id' => ['required', 'integer', Rule::exists('order')],
        ]);
        $messages = $order->messages();
        $customAttributes = $order->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = $order::find($request->id);
        $model->fill($request->all());
        $logDirty = $model->getDirty();
        $logOriginal = $model->getOriginal();
        if ($model->save())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessUpdated'),
                'data' => $model,
                'log' => sprintf('[%s][%s][id:%s][order_no:%s]', __('admin.SuccessUpdated'), $model->tableComments, $model->id, $model->order_no),
                'logOriginal' => $logOriginal,
                'logDirty' => $logDirty
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Order\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, Order $order)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required', Rule::exists('order')->where('order_status', Order::STATUS_CLOSED)],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = is_array($request->id) ? $request->id : [$request->id];
        $model = $order::whereIn('id', $ids);
        if ($model->delete())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessDestroyed'),
                'log' => sprintf('[%s][%s]『id:%s』', __('admin.SuccessDestroyed'), $order->tableComments, json_encode($ids))
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * 关闭订单
     * @param Request $request
     * @param Order $order
     * @return type
     */
    public function close(Request $request, Order $order)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required',],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = $request->id;
        $model = $order::find($ids);
        $model->order_status = Order::STATUS_CLOSED;
        $model->canceled_at = now();
        if ($model->save())
        {
            //触发`订单关闭`事件
            event(new \App\Events\OrderClosed($model));
            return [
                'code' => 200,
                'message' => '成功关闭订单',
                'log' => sprintf('[%s][%s]『id:%s』『order_no:%s』', '成功关闭订单', $order->tableComments, json_encode($ids), $order->order_no)
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * 确认付款
     * @param Request $request
     * @param Order $order
     * @return type
     */
    public function confirmPaid(Request $request, Order $order)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required', 'integer'],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = $request->id;
        $model = $order::find($ids);
        $model->order_status = Order::STATUS_PAID;
        $model->paid_amount = $model->order_amount;
        $model->paid_at = now();
        if ($model->save())
        {
            return [
                'code' => 200,
                'message' => '确认付款',
                'log' => sprintf('[%s][%s]『id:%s』', '确认付款', $order->tableComments, json_encode($ids))
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * 确认发货
     * @param Request $request
     * @param Order $order
     * @return type
     */
    public function confirmShipped(Request $request, Order $order)
    {
        if (!$request->expectsJson())
        {
            $model = $order::find($request->id);
            return $this->view('order.shipped', ['model' => $model,]);
        }
        $validator = Validator::make($request->all(), [
                    'id' => ['required', 'integer'],
                    'tracking_no' => ['required', 'string', 'min:1'],
                    'shipping_remark' => ['nullable', 'string', 'min:1'],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = $request->id;
        $model = $order::find($ids);
        $model->order_status = Order::STATUS_SHIPPED;
        $model->shipped_at = now();
        $model->tracking_no = $request->tracking_no;
        $model->shipping_remark = (string) $request->shipping_remark;
        if ($model->save())
        {
            //触发`订单发货`事件
            event(new \App\Events\OrderShipped($model));
            return [
                'code' => 200,
                'message' => '确认发货',
                'log' => sprintf('[%s][%s]『id:%s』', '确认发货', $order->tableComments, json_encode($ids))
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * 确认退货
     * @param Request $request
     * @param Order $order
     * @return type
     */
    public function confirmReturned(Request $request, Order $order)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required',],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = $request->id;
        $model = $order::find($ids);
        $model->order_status = Order::STATUS_RETURNED;
        $model->returned_at = now();
        if ($model->save())
        {
            return [
                'code' => 200,
                'message' => '确认已退货',
                'log' => sprintf('[%s][%s]『id:%s』', '确认已退货', $order->tableComments, json_encode($ids))
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * 确认完成
     * @param Request $request
     * @param Order $order
     * @return type
     */
    public function confirmDone(Request $request, Order $order)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required',],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = $request->id;
        $model = $order::find($ids);
        $model->order_status = Order::STATUS_DONE;
        $model->received_at = now();
        if ($model->save())
        {
            return [
                'code' => 200,
                'message' => '确认完成',
                'log' => sprintf('[%s][%s]『id:%s』', '确认完成', $order->tableComments, json_encode($ids))
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    public function products(Request $request, OrderProduct $orderProduct)
    {
        if (!$request->expectsJson())
        {
            return $this->view('order.products', ['model' => $orderProduct]);
        }
        $validator = Validator::make($request->all(), [
                    'orderId' => ['required', 'integer', Rule::exists('order', 'id')],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = OrderProduct::orderBy(($request->field ?: 'id'), ($request->order ?: 'desc'));
        $model->where('order_id', $request->orderId);
        if ($request->title)
        {
            $model->where('title', 'like', "%{$request->title}%");
        }
        if ($request->sku)
        {
            $model->where('sku', 'like', "%{$request->sku}%");
        }
        if ($request->created_at_begin && $request->created_at_end)
        {
            $model->whereBetween('created_at', [$request->created_at_begin, Carbon::parse($request->created_at_end)->endOfDay()]);
        }
        if ((isset($request->page) && $request->page <= 0) || $request->export)
        {
            $rows = $model->get();
        } else
        {
            $rows = $model->paginate($request->limit);
        }
        //$rows->makeHidden(['deleted_at']);
        return ['code' => 200, 'message' => __('admin.Success'), 'data' => $rows];
    }

    public function print(Request $request, OrderProduct $orderProductModel)
    {
        $id = explode('|', $request->id);
        $request->merge(['id' => $id]);
        $validator = Validator::make($request->all(), [
                    'id' => ['required', Rule::exists('order')],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        \App::setLocale('en');
        $ids = is_array($request->id) ? $request->id : [$request->id];
        $model = Order::query();
        $model->whereIn('id', $ids);
        $model->with('orderProducts');
        $model->with('buyer:id,email,first_name,last_name');
        $model->with('shippingOption:id,title');
        $model->with('paymentOption:id,title');
        $rows = $model->get();
        foreach ($rows as $row)
        {
            $str_pos = strpos($row->email, '@');
            $str1 = substr($row->email, 0, $str_pos); // @前面的字符
            $str1_len = strlen($str1);
            $str2 = substr($row->email, $str_pos, 100); // @后面的字符
            $str1_len_half1 = intval($str1_len / 2);
            $str1_len_half2 = $str1_len - $str1_len_half1;
            $str1_half_a = substr($str1, 0, $str1_len_half1);
            $str1_half_b = str_repeat('*', $str1_len_half2);
            $str1 = $str1_half_a . $str1_half_b;

            $row->email = $str1 . $str2;

            $tel_str1 = $row->phone;
            $tel_str1_len = strlen($tel_str1);
            $tel_str1_len_half1 = intval($tel_str1_len / 2);
            $tel_str1_len_half2 = $tel_str1_len - $tel_str1_len_half1;
            $tel_str1_half_a = substr($tel_str1, 0, $tel_str1_len_half1);
            $tel_str1_half_b = str_repeat('*', $tel_str1_len_half2);

            $row->phone = $tel_str1_half_a . $tel_str1_half_b;

            $address_str1 = $row->address_line_1;
            $address_str1_len = strlen($address_str1);
            $address_str1_len_half1 = intval($address_str1_len / 2);
            $address_str1_len_half2 = $address_str1_len - $address_str1_len_half1;
            $address_str1_half_a = substr($address_str1, 0, $address_str1_len_half1);
            $address_str1_half_b = str_repeat('*', $address_str1_len_half2);

            $row->address_line_1 = $address_str1_half_a . $address_str1_half_b;
        }
        return $this->view('order.print', ['rows' => $rows, 'orderProductModel' => $orderProductModel]);
    }

}
