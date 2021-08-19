@extends('admin.layouts.app')

@push('styles')
<style>
    .st-fee td > strong{
        display: inline-block;
        width:70px;
        text-align: right;
    }
    .st-fee td > span.st-amount{
        display: inline-block;
        width:85px;
        text-align: left;
    }
    .st-fee td > span.st-amount-original{
        display: inline-block;
        width:120px;
        text-align: left;
    }
</style>
@endpush

@push('scripts')
<script></script>
@endpush

@section('content')
<div class="st-h15"></div>
<p>
    <a class="layui-btn layui-btn-xs" href="/admin/order/print?id={{$model->id}}" target="_blank">打印</a>
</p>
<table class="layui-table" lay-size="sm">
    <colgroup>
        <col width="150"></col>
        <col></col>
        <col width="150"></col>
        <col></col>
    </colgroup>
    <thead>
        <tr>
            <th colspan="4" style="text-align: center;background: #eee;">基本信息</th>
        </tr> 
    </thead>
    <tbody>
        <tr>
            <td align="right"><strong>{{$model->getAttributeLabel('order_no')}}</strong></td>
            <td>{{$model->order_no}}</td>
            <td align="right"><strong>{{$model->getAttributeLabel('order_status')}}</strong></td>
            <td>
                <span class="layui-badge {{$model->order_status_style}}">{{$model->order_status_label}}</span>
            </td>
        </tr>
        <tr>
            <td align="right"><strong>{{$model->getAttributeLabel('user_id')}}</strong></td>
            <td>{{$model->buyer->email}}</td>
            <td align="right"><strong>{{$model->getAttributeLabel('created_at')}}</strong></td>
            <td>{{$model->created_at}}</td>
        </tr>
        <tr>
            <td align="right"><strong>{{$model->getAttributeLabel('payment_option_id')}}</strong></td>
            <td>{{$model->paymentOption->title}}</td>
            <td align="right"><strong>{{$model->getAttributeLabel('paid_at')}}</strong></td>
            <td>{{$model->paid_at}}</td>
        </tr>
        <tr>
            <td align="right"><strong>{{$model->getAttributeLabel('shipping_option_id')}}</strong></td>
            <td>{{$model->shippingOption->title}}</td>
            <td align="right"><strong>{{$model->getAttributeLabel('shipped_at')}}</strong></td>
            <td>{{$model->shipped_at}}</td>
        </tr>
        <tr>
            <td align="right"><strong>{{$model->getAttributeLabel('tracking_no')}}</strong></td>
            <td>{{$model->tracking_no}}</td>
            <td align="right"><strong>{{$model->getAttributeLabel('source')}}</strong></td>
            <td>{{$model->source}}</td>
        </tr>
        <tr>
            <td align="right"><strong>{{$model->getAttributeLabel('received_at')}}</strong></td>
            <td>{{$model->received_at}}</td>
            <td align="right"><strong>{{$model->getAttributeLabel('canceled_at')}}</strong></td>
            <td>{{$model->canceled_at}}</td>
        </tr>
        <tr>
            <td align="right"><strong>{{$model->getAttributeLabel('returned_at')}}</strong></td>
            <td>{{$model->returned_at}}</td>
            <td align="right"><strong>{{$model->getAttributeLabel('pay_remark')}}</strong></td>
            <td>{{$model->pay_remark}}</td>
        </tr>
        <tr>
        </tr>
    </tbody>
</table>

<table class="layui-table" lay-size="sm">
    <colgroup>
        <col width="150"></col>
        <col></col>
        <col width="150"></col>
        <col></col>
    </colgroup>
    <thead>
        <tr>
            <th colspan="4" style="text-align: center;background: #eee;">收货信息</th>
        </tr> 
    </thead>
    <tbody>
        <tr>
            <td align="right"><strong>{{$model->getAttributeLabel('first_name')}}/{{$model->getAttributeLabel('last_name')}}</strong></td>
            <td>{{$model->first_name}} {{$model->last_name}}</td>
            <td align="right"><strong>{{$model->getAttributeLabel('eamil')}}</strong></td>
            <td>{{$model->email}}</td>
        </tr>
        <tr>
            <td align="right"><strong>{{$model->getAttributeLabel('address_line_1')}}</strong></td>
            <td>{{$model->address_line_1}}, {{$model->city}} @if($model->state) , {{$model->state}} @else , {{$model->state_other}} @endif , {{$model->country}} </td>
            <td align="right"><strong>{{$model->getAttributeLabel('postal_code')}}</strong></td>
            <td>{{$model->postal_code}}</td>
        </tr>
        <tr>
            <td align="right"><strong>{{$model->getAttributeLabel('phone')}}</strong></td>
            <td>{{$model->phone}}</td>
            <td align="right"><strong>{{$model->getAttributeLabel('remark')}}</strong></td>
            <td>{{$model->remark}}</td>
        </tr>
    </tbody>
</table>
<table class="layui-table" lay-size="sm">
    <thead>
        <tr>
            <th colspan="14" style="text-align: center;background: #eee;">产品信息</th>
        </tr> 
    </thead>
    <thead>
        <tr>
            <th>{{$orderProductModel->getAttributeLabel("title")}}</th>
            <th>{{$orderProductModel->getAttributeLabel("sku")}}</th>
            <th>{{$orderProductModel->getAttributeLabel("img_cover")}}</th>
            <th>{{$orderProductModel->getAttributeLabel("currency_code")}}/{{$orderProductModel->getAttributeLabel("currency_rate")}}</th>
            <th>{{$orderProductModel->getAttributeLabel("specs")}}</th>
            <th>{{$orderProductModel->getAttributeLabel("weight")}}</th>
            <th>{{$orderProductModel->getAttributeLabel("qty")}}</th>
            <th>{{$orderProductModel->getAttributeLabel("sale_price")}}</th>
            <th>{{$orderProductModel->getAttributeLabel("subtotal")}}</th>
        </tr> 
    </thead>
    <tbody>
        @foreach($model->orderProducts as $orderProduct)
        <tr>
            <td>{{$orderProduct->title}}</td>
            <td>{{$orderProduct->sku}}</td>
            <td><img src="{{$orderProduct->img_cover}}" height="35" /></td>
            <td>{{$orderProduct->currency_code}} / {{floatval($orderProduct->currency_rate)}}</td>
            <td>
                @forelse($orderProduct->specs as $spec)
                {{$spec->name}}:{{$spec->value}}
                @empty
                @endforelse
            </td>
            <td>{{$orderProduct->weight/1000}}kg</td>
            <td>{{$orderProduct->qty}}</td>
            <td>
                {{$orderProduct->currency_code}} {{$orderProduct->sale_price}}
                @if(config("strongshop.defaultCurrencyBackend") !== $orderProduct->currency_code)
                <hr/>
                {{config("strongshop.defaultCurrencyBackend")}} {{round($orderProduct->sale_price / $orderProduct->currency_rate, config("strongshop.defaultDedimal"))}}
                @endif
            </td>
            <td>
                {{$orderProduct->currency_code}} {{$orderProduct->subtotal}}
                @if(config("strongshop.defaultCurrencyBackend") !== $orderProduct->currency_code)
                <hr/>
                {{config("strongshop.defaultCurrencyBackend")}} {{round($orderProduct->subtotal / $orderProduct->currency_rate, config("strongshop.defaultDedimal"))}}
                @endif
            </td>
        </tr>
        @endforeach
        <tr>
            <td colspan="8" align="right"><strong>{{$model->getAttributeLabel('weight_total')}}</strong></td>
            <td>{{$model->weight_total/1000}}kg</td>
        </tr>
    </tbody>
</table>
<table class="layui-table" lay-size="sm">
    <colgroup>
        <col width="150"></col>
        <col></col>
        <col width="150"></col>
        <col></col>
    </colgroup>
    <thead>
        <tr>
            <th colspan="4" style="text-align: center;background: #eee;">费用信息</th>
        </tr> 
    </thead>
    <tbody class="st-fee">
        <tr>
            <td align="right"><strong>{{$model->getAttributeLabel('currency_code')}}</strong></td>
            <td>{{$model->currency_code}}</td>
            <td align="right"><strong>{{$model->getAttributeLabel('currency_rate')}}</strong></td>
            <td>{{$model->currency_rate}}</td>
        </tr>
        <tr>
            <td colspan="4" align="right">
                <strong>{{$model->getAttributeLabel('products_amount')}}</strong>:
                <span class="st-amount">{{$model->currency_code}} {{$model->products_amount}}</span>
                @if(config("strongshop.defaultCurrencyBackend") !== $orderProduct->currency_code)
                <span class="st-amount-original">（{{config("strongshop.defaultCurrencyBackend")}} {{round($model->products_amount / $model->currency_rate, config("strongshop.defaultDedimal"))}}）</span>
                @endif
            </td>
        </tr>
        <tr>
            <td colspan="4" align="right">
                <strong>{{$model->getAttributeLabel('shipping_fee')}}:</strong>
                <span class="st-amount">{{$model->currency_code}} {{$model->shipping_fee}}</span>
                @if(config("strongshop.defaultCurrencyBackend") !== $orderProduct->currency_code)
                <span class="st-amount-original">（{{config("strongshop.defaultCurrencyBackend")}} {{round($model->shipping_fee / $model->currency_rate, config("strongshop.defaultDedimal"))}}）</span>
                @endif
            </td>
        </tr>
        <tr>
            <td colspan="4" align="right">
                <strong>{{$model->getAttributeLabel('handling_fee')}}:</strong>
                <span class="st-amount">{{$model->currency_code}} {{$model->handling_fee}}</span>
                @if(config("strongshop.defaultCurrencyBackend") !== $orderProduct->currency_code)
                <span class="st-amount-original">（{{config("strongshop.defaultCurrencyBackend")}} {{round($model->handling_fee / $model->currency_rate, config("strongshop.defaultDedimal"))}}）</span>
                @endif
            </td>
        </tr>
        <tr>
            <td colspan="4" align="right">
                <strong>{{$model->getAttributeLabel('tax_fee')}}:</strong>
                <span class="st-amount">{{$model->currency_code}} {{$model->tax_fee}}</span>
                @if(config("strongshop.defaultCurrencyBackend") !== $orderProduct->currency_code)
                <span class="st-amount-original">（{{config("strongshop.defaultCurrencyBackend")}} {{round($model->tax_fee / $model->currency_rate, config("strongshop.defaultDedimal"))}}）</span>
                @endif
            </td>
        </tr>
        <tr>
            <td colspan="4" align="right">
                <strong>{{$model->getAttributeLabel('discount_amount')}}:</strong>
                <span class="st-amount">{{$model->currency_code}} {{$model->discount_amount}}</span>
                @if(config("strongshop.defaultCurrencyBackend") !== $orderProduct->currency_code)
                <span class="st-amount-original">（{{config("strongshop.defaultCurrencyBackend")}} {{round($model->discount_amount / $model->currency_rate, config("strongshop.defaultDedimal"))}}）</span>
                @endif
            </td>
        </tr>
        <tr>
            <td colspan="4" align="right">
                <strong>{{$model->getAttributeLabel('used_credits_amount')}}:</strong>
                <span class="st-amount">{{$model->currency_code}} {{$model->used_credits_amount}}</span>
                @if(config("strongshop.defaultCurrencyBackend") !== $orderProduct->currency_code)
                <span class="st-amount-original">（{{config("strongshop.defaultCurrencyBackend")}} {{round($model->used_credits_amount / $model->currency_rate, config("strongshop.defaultDedimal"))}}）</span>
                @endif
            </td>
        </tr>
        <tr>
            <td colspan="4" align="right">
                <strong>{{$model->getAttributeLabel('order_amount')}}:</strong>
                <span class="st-amount">{{$model->currency_code}} {{$model->order_amount}}</span>
                @if(config("strongshop.defaultCurrencyBackend") !== $orderProduct->currency_code)
                <span class="st-amount-original">（{{config("strongshop.defaultCurrencyBackend")}} {{round($model->order_amount / $model->currency_rate, config("strongshop.defaultDedimal"))}}）</span>
                @endif
            </td>
        </tr>
        <tr>
            <td colspan="4" align="right">
                <strong>{{$model->getAttributeLabel('paid_amount')}}:</strong>
                <span class="st-amount">{{$model->currency_code}} {{$model->paid_amount}}</span>
                @if(config("strongshop.defaultCurrencyBackend") !== $orderProduct->currency_code)
                <span class="st-amount-original">（{{config("strongshop.defaultCurrencyBackend")}} {{round($model->paid_amount / $model->currency_rate, config("strongshop.defaultDedimal"))}}）</span>
                @endif
            </td>
        </tr>
    </tbody>
</table>

<div class="st-h50"></div>
@endsection

@push('scripts_bottom')
<script>
    !function () {
        //...
    }();
</script>
@endpush
