@extends('layouts.app')

@section('content')
<div class="st-user">
    <div class="st-h20"></div>
    <div class="container">
        @if (session('resent'))
        <div class="alert alert-success" role="alert">
            {{ __('A fresh verification link has been sent to your email address.') }}
        </div>
        @endif
        @if (session('verified'))
        <div class="alert alert-success" role="alert">
            {{ __('Your mailbox has been successfully verified.') }}
        </div>
        @endif
        <div class="row">
            <div class="col-xs-12 col-sm-3">
                <div class="list-group">
                    @include('layouts.includes.userMenus')
                </div>
            </div>
            <div class="col-xs-12 col-sm-9">
                <div class="panel panel-default st-user-orders">
                    <div class="panel-body table-responsive">
                        <div class="st-date">
                            <div class="page-header">
                                <h4>@lang('Order NO.')： {{$row->order_no}}</h4>
                            </div>
                            <p>
                                @if(in_array($row->order_status,[10,13,14]))
                                <span class="label label-danger">
                                @elseif(in_array($row->order_status,[12,20]))
                                <span class="label label-success">
                                @else
                                <span class="label label-default">
                                @endif
                                    {{$row->order_status_label}}
                                </span> &nbsp;
                                @if($row->order_status == 10)
                                <a class="btn btn-primary btn-xs bi-credit-card" href="{{route('payment.pay', ['paycode'=>$row->paymentOption->code,'orderId'=>$row->id])}}"> @lang('Pay')</a>
                                <button onclick="Util.cancelOrder({{$row->id}});" class="btn btn-default btn-xs">@lang('Cancel')</button>
                                @elseif($row->order_status == 20)
                                <button onclick="Util.receiveOrder({{$row->id}});" class="btn btn-default btn-xs">@lang('Received')</button>
                                @endif
                                <hr/>
                            </p>
                            <p><label>@lang('Created At')：</label>{{$row->created_at}}</p>
                            @if($row->paid_at)
                            <p><label>@lang('Paid At')：</label>{{$row->paid_at}}</p>
                            @endif
                            @if($row->canceled_at)
                            <p><label>@lang('Canceled At')：</label>{{$row->canceled_at}}</p>
                            @endif
                            @if($row->shipped_at)
                            <p><label>@lang('Shipped At')：</label>{{$row->shipped_at}}</p>
                            @endif
                            @if($row->received_at)
                            <p><label>@lang('Received At')：</label>{{$row->received_at}}</p>
                            @endif
                            <p><label>@lang('Payment')：</label>{{$row->PaymentOption->title}}</p>
                            <p>
                                <label>@lang('Shipping')：</label>{{$row->ShippingOption->title}} 
                                @if($row->tracking_no)
                                <a href="{{route('user.orderTracking', ['order_no'=>$row->order_no])}}" class="badge">@lang('Order Tracking'): {{$row->tracking_no}}</a>
                                @endif
                                <br/>
                            </p>
                            <p class="st-shipdesc">{{$row->ShippingOption->desc}}</p>
                        </div>
                        <div class="st-h20"></div>
                        <div>
                            <div class="page-header">
                                <h4>@lang('Products')</h4>
                            </div>
                            <table class="table">
                                <tbody>
                                    @foreach($row->orderProducts as $orderProduct)
                                    <tr>
                                        <td>
                                            <div class="media">
                                                <div class="media-left">
                                                    <a href="{{route('product.show', ['id'=>$orderProduct->product_id])}}">
                                                        <img alt="{{$row->title}}" class="media-object" src="{{$orderProduct->img_cover}}">
                                                    </a>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"><a href="{{route('product.show', ['id'=>$orderProduct->product_id])}}">{{$orderProduct->title}}</a></h5>
                                                    <p class="st-itemcode">@lang('Item code #'):{{$orderProduct->sku}}</p>
                                                    <p class="st-itemcode">
                                                        <small>
                                                            @foreach($orderProduct['specs'] as $spec)
                                                            {{$spec->name}}:{{$spec->value}} 
                                                            @endforeach
                                                        </small>
                                                    </p>
                                                    <p class="st-price">{{$orderProduct->qty}} x {{$row->currency_code}} {{$orderProduct->sale_price}}</p>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    @endforeach
                                    <tr>
                                        <td colspan="2">
                                            <p><label>@lang('Products Amount'):</label> <span>{{$row->currency_code}} {{$row->products_amount}}</span></p>
                                            <p><label>@lang('Shipping Cost'):</label> <span>{{$row->currency_code}} {{$row->shipping_fee}}</span></p>
                                            <p><label>@lang('Handing Cost'):</label> <span>{{$row->currency_code}} {{$row->handling_fee}}</span></p>
                                            <p><label>@lang('Tax Cost'):</label> <span>{{$row->currency_code}} {{$row->tax_fee}}</span></p>
                                            <!--<p><label>@lang('Used Credits Amount'):</label> <span>{{$row->currency_code}} {{$row->used_credits_amount}}</span></p>-->
                                            <!--<p><label>@lang('Discount Amount'):</label> <span>{{$row->currency_code}} {{$row->discount_amount}}</span></p>-->
                                            <p><label>@lang('Order Total'):</label> <span>{{$row->currency_code}} {{$row->order_amount}}</span></p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div>
                            <div class="page-header">
                                <h4>@lang('Ship to')</h4>
                            </div>
                            <p>
                                <strong>{{$row->first_name}} {{$row->last_name}}</strong>
                            </p>
                            <p>
                                {{$row->address_line_1}}
                            </p>
                            <p>
                                {{$row->city}}, 
                                @if($row->state)
                                    {{$row->state}}, 
                                @elseif($row->state_other)
                                    {{$row->state_other}}, 
                                @endif 
                                {{$row->postal_code}}, {{$row->phone}}
                            </p>
                            <p>
                                {{$row->country}}
                            </p>
<!--                            <p><label>@lang('Country')：</label> {{$row->country}}</small></p>
                            <p><label>@lang('First Name')：</label> {{$row->first_name}}</small></p>
                            <p><label>@lang('Last Name')：</label> {{$row->last_name}}</small></p>
                            <p><label>@lang('Email')：</label> {{$row->email}}</small></p>
                            <p><label>@lang('Phone Number')：</label> {{$row->phone}}</small></p>
                            <p><label>@lang('Fax Number')：</label> {{$row->fax}}</small></p>
                            <p><label>@lang('State/Province')：</label> {{$row->state}}</small></p>
                            <p><label>@lang('Other State/Province')：</label> {{$row->state_other}}</small></p>
                            <p><label>@lang('Town/City')：</label> {{$row->city}}</small></p>
                            <p><label>@lang('Address Line 1')：</label> {{$row->address_line_1}}</small></p>
                            <p><label>@lang('Address Line 2')：</label> {{$row->address_line_2}}</small></p>
                            <p><label>@lang('Zip/Postal Code')：</label> {{$row->postal_code}}</small></p>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="st-h20"></div>

</div>

<div class="st-h50 clearfix"></div>
@endsection
