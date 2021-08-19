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
                        <div>
                            <div class="page-header">
                                <h4>@lang('My Orders')</h4>
                            </div>
                            @forelse($rows as $row)
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th><a href="{{route('user.my.order.detail', ['orderId'=>$row->id])}}">@lang('Order NO.'): {{$row->order_no}}</a></th>
                                    </tr>
                                    <tr>
                                        <th>
                                            <font style="font-size:12px;font-weight: lighter;">{{$row->created_at}}</font> 
                                        </th>
                                    </tr>
                                    <tr>
                                        <th>
                                            <font>{{$row->currency_code}} {{$row->order_amount}} </font>
                                            @if(in_array($row->order_status,[10,13,14]))
                                            <span class="label label-danger">
                                            @elseif(in_array($row->order_status,[12,20]))
                                            <span class="label label-success">
                                            @else
                                            <span class="label label-default">
                                            @endif
                                                {{$row->order_status_label}}
                                            </span>
                                            &nbsp;
                                            <a class="btn btn-default btn-xs" href="{{route('user.my.order.detail', ['orderId'=>$row->id])}}">@lang('Order Detail')</a>
                                            &nbsp;
                                            @if($row->order_status == 10)
                                                <a class="btn btn-primary btn-xs bi-credit-card" href="{{route('payment.pay', ['paycode'=>$row->paymentOption->code,'orderId'=>$row->id])}}"> @lang('Pay')</a>
                                            @elseif($row->order_status == 20)
                                                <button class="btn btn-primary btn-xs" onclick="Util.receiveOrder({{$row->id}});">@lang('Received')</button>
                                            @endif
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            @foreach($row->orderProducts as $orderProduct)
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
                                            @endforeach
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            @empty
                            <p class="text-center">@lang('No data.') <a href='/'>@lang('Go Home')</a></p>
                            @endforelse
                            <ul class="pager pull-left">
                                @if($rows->onFirstPage())
                                <li class="disabled"><a href="javascript:void(0)">@lang('Previous')</a></li>
                                @else
                                <li><a href="{{$rows->previousPageUrl()}}">@lang('Previous')</a></li>
                                @endif
                                @if($rows->hasMorePages())
                                <li><a href="{{$rows->nextPageUrl()}}">@lang('Next')</a></li>
                                @else
                                <li class="disabled"><a href="javascript:void(0)">@lang('Next')</a></li>
                                @endif
                            </ul>
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
