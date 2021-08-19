<style type="text/css">
    *{ font-size:12px !important;}
    .st-total{
        display: inline-block;
        width:90px;
        text-align: right;
    }
</style>
@foreach($rows as $row)
<h3 align="center" style="margin:0;padding:0;"><img width='200' src="/img/logo.272x92.png" /></h3>
<h2 align="center">Order Details</h2>
<table width="100%" cellpadding="1">
    <tbody>
        <tr>
            <td width="8%">@lang('Buyer'):</td>
            <td>{{$row->email}}<!-- 购货人姓名 --></td>
            <td align="right">@lang('Order time'):</td>
            <td>{{$row->created_at}}<!-- 下订单时间 --></td>
            <td align="right">@lang('Payment method'):</td>
            <td>{{$row->paymentOption->title}}<!-- 支付方式 --></td>
            <td align="right">@lang('Order NO.'):</td>
            <td>{{$row->order_no}}<!-- 订单号 --></td>
        </tr>
        <tr>
            <td>@lang('Payment time'):</td>
            <td>{{$row->paid_at}}<!-- 付款时间 --></td>
            <td align="right">@lang('Shipping method'):</td>
            <td>{{$row->shippingOption->title}}<!-- 配送方式 --></td>
            <td align="right">&nbsp;</td>
            <td>&nbsp;</td>
            <td align="right">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>@lang('Consignee'):</td>
            <td colspan="7">
                {{$row->first_name}} {{$row->last_name}}  <!-- 收货人姓名 -->
                @lang('Receipt address'):
                {{$row->address_line_1}} , {{$row->city}} @if($row->state) , {{$row->state}} @else , {{$row->state_other}} @endif , {{$row->country}}, ;<!-- 收货人地址 -->
                {{$row->postal_code}}, <!-- 邮政编码 -->
                {{$row->phone}}<!-- 联系电话 -->
            </td>
        </tr>
    </tbody>
</table>
<table style="border-collapse:collapse;border-color:#000;" width="100%" border="1">
    <tbody>
        <tr align="center">
            <td bgcolor="#cccccc">@lang('Item name')  <!-- 商品名称 --></td>
            <td bgcolor="#cccccc">@lang('Item code') <!-- 商品货号 --></td>
            <td bgcolor="#cccccc">@lang('Attribute')  <!-- 商品属性 --></td>
            <td bgcolor="#cccccc">@lang('Price') <!-- 商品单价 --></td>
            <td bgcolor="#cccccc">@lang('Qty.')<!-- 商品数量 --></td>
            <td bgcolor="#cccccc">@lang('Subtotal')    <!-- 价格小计 --></td>
        </tr>
        @foreach($row->orderProducts as $orderProduct)
        <tr>
            <td>&nbsp;{{$orderProduct->title}}<!-- 商品名称 --></td>
            <td>&nbsp;{{$orderProduct->sku}} <!-- 商品货号 --></td>
            <td>
                @forelse($orderProduct->specs as $spec)
                {{$spec->name}}:{{$spec->value}} 
                @empty
                @endforelse
            </td>
            <td align="right">{{$row->currency_code}} {{$orderProduct->sale_price}}&nbsp;<!-- 商品单价 --></td>
            <td align="right">{{$orderProduct->qty}}&nbsp;<!-- 商品数量 --></td>
            <td align="right">{{$row->currency_code}} {{$orderProduct->subtotal}}&nbsp;<!-- 商品金额小计 --></td>
        </tr>
        @endforeach
    </tbody>
</table>
<table width="100%" border="0">
    <tbody>
        <tr align="right">
            <td>
                <!-- 商品总金额 -->
                @lang('Products Amount'): <span class="st-total">{{$row->currency_code}} {{$row->products_amount}}</span><br/>
                <!-- 配送费用 --> 
                @if($row->shipping_fee > 0)
                @lang('Shipping Cost'): <span class="st-total">{{$row->currency_code}} {{$row->shipping_fee}}</span><br/>
                @endif
                <!-- 支付手续费 --> 
                @if($row->handling_fee > 0)
                @lang('Handing Cost'): <span class="st-total">{{$row->currency_code}} {{$row->handling_fee}}</span><br/>
                @endif
                <!-- 税收费用 --> 
                @if($row->tax_fee > 0)
                @lang('Tax Cost'): <span class="st-total">{{$row->currency_code}} {{$row->tax_fee}}</span><br/>
                @endif
                <!--积分使用-->
                @if($row->handing_cost > 0)
                @lang('Used Credits Amount'): <span class="st-total">{{$row->currency_code}} {{$row->used_credits_amount}}</span><br/>
                @endif
                <!--优惠金额-->
                @if($row->discount_amount > 0)
                @lang('Discount Amount'): <span class="st-total">{{$row->currency_code}} {{$row->discount_amount}}</span><br/>
                @endif
                <!--订单金额|支付金额-->
                @lang('Order Total'): <span class="st-total">{{$row->currency_code}} {{$row->order_amount}}</span><br/>
            </td>
        </tr>
    </tbody>
</table>
<table width="100%" border="0">
    <tbody>
        @if($row->remark)
        <tr> <!-- 支付备注 -->
            <td><strong>@lang('Order Remark'):</strong> {{$row->remark}}</td>
        </tr>
        @endif
        <tr>
            <!-- 网店名称, 网店地址, 网店URL以及联系电话 -->
            <td>{{config('app.name')}}（{{config('app.url')}}）</td>
            <td align="right">@lang('Print time'):{{now()}}&nbsp;&nbsp;&nbsp;Operator:{{auth('admin')->user()->name}}</td>
        </tr>
    </tbody>
</table>
<div style="PAGE-BREAK-AFTER:always"></div>
@endforeach
