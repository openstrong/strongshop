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
                <div class="panel panel-default st-user-wishlist">
                    <div class="panel-body table-responsive">
                        <div>
                            <div class="page-header">
                                <h4>@lang('My Wish List')</h4>
                            </div>
                            <table class="table">
                                <tbody>
                                    @forelse($rows as $row)
                                    <tr>
                                        <td>
                                            <div class="media">
                                                <div class="media-left">
                                                    <a href="{{route('product.show', ['id'=>$row->id])}}">
                                                        <img alt="{{$row->title}}" class="media-object" src="{{$row->img_cover}}">
                                                    </a>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading"><a href="{{route('product.show', ['id'=>$row->id])}}">{{$row->title}}</a></h5>
                                                    <p class="st-itemcode">@lang('Item code #'):{{$row->sku}}</p>
                                                    <p class="st-price">{{$_current_currency_name}} {{$row->sale_price}}</p>
                                                    <p class="st-datetime">{{$row->collect_at}}</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <button class="btn btn-default btn-xs glyphicon glyphicon-trash st-removecart" onclick="Util.removeCollects({{$row->id}})"></button>
                                        </td>
                                    </tr>
                                    @empty
                                    <p class="text-center">@lang('No data.') <a href='/'>@lang('Go Home')</a></p>
                                    @endforelse
                                </tbody>
                            </table>
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
