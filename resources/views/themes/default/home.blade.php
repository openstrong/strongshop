@extends('layouts.app')
@push('styles')
<meta http-equiv="pragram" content="no-cache">
<meta http-equiv="cache-control" content="no-cache, no-store, must-revalidate">
<style>
    .carousel-indicators li{
        border: 1px solid gray;
    }
    .carousel-indicators .active{
        border: 1px solid #fff;
        background: gray;
    }
</style>
@endpush
@section('content')
<!-- Banner 轮播图-->
<div class="st-banner">
    <div class="container">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <a href="#"><img alt="{{config('strongshop.storeName')}}" src="img/banner01.jpg" data-holder-rendered="true"></a>
                </div>
                <div class="item">
                    <a href="#"><img alt="{{config('strongshop.storeName')}}" src="img/banner02.jpg" data-holder-rendered="true"></a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="st-h20"></div>
<div class="st-home-aboutus">
    <div class="container">
        <div class="jumbotron">
            <h1>About {{config('strongshop.storeName')}}</h1>
            <p>
                开源免费的跨境电商网站。
            </p>
            <p><a class="btn btn-primary btn-sm" href="#" role="button">Learn more</a></p>
        </div>
    </div>
</div>
<div class="st-home-product">
    <!--推荐产品-->
    @if($recommendRows->isNotEmpty())
    <div class="container">
        <div class="page-header">
            <h4><a href="{{route('product.list', ['is_recommend'=>1])}}" class="st-home-product-title"><span class="glyphicon glyphicon-chevron-right"></span> @lang('Recommend Products')</a></h4>
        </div>
        <div class="row">
            @foreach($recommendRows as $recommendRow)
            <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                <div class="thumbnail">
                    <a href="{{route('product.show.rewrite', ['id'=>$recommendRow->id])}}" class="st-thumb">
                        <img alt="{{$recommendRow->title}}" src="{{$recommendRow->img_cover}}" class="img-responsive" />
                    </a>
                    <div class="caption">
                        <h5 title="{{$recommendRow->title}}"><a href="{{route('product.show.rewrite', ['id'=>$recommendRow->id])}}">{{$recommendRow->title}}</a></h5>
                        <p class="st-home-product-price">{{$_current_currency_name}} {{$recommendRow->sale_price}}</p>
                        <p class="st-home-product-sold">{{$recommendRow->click_num}} @lang('clicks')</p>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
    @endif
    <!--新品-->
    @if($newRows->isNotEmpty())
    <div class="container">
        <div class="page-header">
            <h4><a href="{{route('product.list', ['is_new'=>1])}}" class="st-home-product-title"><span class="glyphicon glyphicon-chevron-right"></span> @lang('New Products')</a></h4>
        </div>
        <div class="row">
            @foreach($newRows as $newRow)
            <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                <div class="thumbnail">
                    <a href="{{route('product.show.rewrite', ['id'=>$newRow->id])}}" class="st-thumb">
                        <img alt="{{$newRow->title}}" src="{{$newRow->img_cover}}" class="img-responsive" />
                    </a>
                    <div class="caption">
                        <h5 title="{{$newRow->title}}"><a href="{{route('product.show.rewrite', ['id'=>$newRow->id])}}">{{$newRow->title}}</a></h5>
                        <p class="st-home-product-price">{{$_current_currency_name}} {{$newRow->sale_price}}</p>
                        <p class="st-home-product-sold">{{$newRow->click_num}} @lang('clicks')</p>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
    @endif
    <!--热卖-->
    @if($hotRows->isNotEmpty())
    <div class="container">
        <div class="page-header">
            <h4><a href="{{route('product.list', ['is_hot'=>1])}}" class="st-home-product-title"><span class="glyphicon glyphicon-chevron-right"></span> @lang('Hot Products')</a></h4>
        </div>
        <div class="row">
            @foreach($hotRows as $hotRow)
            <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                <div class="thumbnail">
                    <a href="{{route('product.show.rewrite', ['id'=>$hotRow->id])}}" class="st-thumb">
                        <img alt="{{$hotRow->title}}" src="{{$hotRow->img_cover}}" class="img-responsive" />
                    </a>
                    <div class="caption">
                        <h5 title="{{$hotRow->title}}"><a href="{{route('product.show.rewrite', ['id'=>$hotRow->id])}}">{{$hotRow->title}}</a></h5>
                        <p class="st-home-product-price">{{$_current_currency_name}} {{$hotRow->sale_price}}</p>
                        <p class="st-home-product-sold">{{$hotRow->click_num}} @lang('clicks')</p>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
    @endif
</div>
@endsection
