@extends('layouts.app')

@push('styles')
<link rel="stylesheet" href="{{ asset('vendor/swiper/swiper-bundle.min.css') }}">
@endpush

@section('content')
@include('layouts.includes.breadcrumb')
<!--主体区域-->
<div class="st-main">
    <div class="container">
        <div class="row">
            <!--主体左侧-产品图册信息-->
            <div class="col-sm-12 col-md-7 col-lg-5">
                <!--PC端轮播图-->
                <div class="st-detail-img hidden-xs hidden-sm">
                    <div class="st-detail-img-left pull-left">
                        <ul>
                            @foreach($row->asset_img_photos as $photo)
                            <li @if ($loop->first)class="active" @endif><img src="{{$photo['src']}}" data-src="{{$photo['src']}}" alt="{{$row->title}}"></li>
                            @endforeach
                        </ul>
                    </div>
                    <div class="st-detail-img-right pull-right">
                        <div class="pic">
                            @isset($row->asset_img_photos[0]['src'])
                            <img src="{{$row->asset_img_photos[0]['src']}}" alt="{{$row->title}}">
                            @endisset
                            <div class="magnify"></div>
                        </div>
                        <div class="bigpic">
                            @isset($row->asset_img_photos[0]['src'])
                            <img src="{{$row->asset_img_photos[0]['src']}}" alt="{{$row->title}}"  >
                            @endisset
                        </div>
                        <div class="st-detail-img-right-share">
                            <!--分享-->
                            <p class="st-share">@lang('Share to'): 
                                <a href="#" class="bi-facebook"></a>
                                <a href="#" class="bi-twitter"></a>
                                <a href="#" class="bi-instagram"></a>
                                <a href="#" class="bi-linkedin"></a>
                            </p>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <!--移动端轮播图-->
                <div class="st-detail-img visible-xs visible-sm">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            @foreach($row->asset_img_photos as $photo)
                            <div class="swiper-slide"><img src="{{$photo['src']}}" alt="{{$row->title}}" class="img-responsive"></div>
                            @endforeach
                        </div>
                        <!-- Add Pagination -->
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-5 col-lg-7">
                <div class="row">
                    <!--主体右侧-产品属性信息-->
                    <div class="col-sm-12 col-lg-7">
                        <div class="st-detail-attr">
                            <h3>{{$row->title}}</h3>
                            <dl class="st-general st-itemcode">
                                <dd>@lang('Item code #'):{{$row->sku}}</dd>
                            </dl>
                            <dl class="st-general st-price">
                                <dt>{{$_current_currency_name}} {{$row->sale_price}}<del>{{$_current_currency_name}} {{$row->original_price}}</del></dt>
                            </dl>
                            @foreach($row->specs as $spec)
                            <dl class="st-attr @if($spec['is_show_img'] ==1)st-picture @endif">
                                <dt>{{$spec['name']}}:</dt>
                                @foreach($spec['spu_specs'] as $spu_spec)
                                <dd title="{{$spu_spec['pivot']['spec_value']}}" data-toggle="tooltip" data-placement="top" data-spec="{{$spu_spec['pivot']['spec_value']}}" @if($spec['pivot']['spec_value'] == $spu_spec['pivot']['spec_value']) class="active" @endif>
                                    @if($spec['is_show_img'] ==1)
                                    <img src="{{$spu_spec['product_img']}}" />
                                    @else
                                    {{$spu_spec['pivot']['spec_value']}}
                                    @endif
                                </dd>
                                @endforeach
                            </dl>
                            @endforeach
                        </div>
                    </div>
                    <!--主体右侧-操作按钮-->
                    <div class="col-sm-12 col-lg-5 st-detail-btn">
                        <div class="st-detail-btn-right">
                            <!--批发信息-->
                            @if(count($row->wholesale_set['num']))
                            <div class="st-whosale">
                                <table class="table">
                                    <!--<caption>@lang('Wholesale')</caption>-->
                                    <thead>
                                        <tr>
                                            <th>@lang('QTY')</th>
                                            <th>@lang('Price')</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($row->wholesale_set['num'] as $wholesale_num)
                                        <tr>
                                            <td>
                                                @if($loop->last) <font>≥</font> @else <font>≥</font> @endif
                                                {{$wholesale_num}}
                                            </td>
                                            <td>{{$_current_currency_name}} {{$row->wholesale_set['price'][$loop->index]}}</td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            @endif
                            <!--库存状态-->
                            @if($row->stock_status == 1 && $row->stock >0)
                            <p class="st-instock">{{$row->stock}} @lang('in stock').</p>
                            @else
                            <p class="st-stockout">@lang('Stock Out.')</p>
                            @endif
                            <!--购物数量-->
                            <p class="st-qty">
                                @lang('QTY'): <input id="ST-QTY" name="qty" value="1" type="number" min="1" max="99999" />
                            </p>
                            <!--按钮-->
                            <p class="st-btn">
                                <button class="btn btn-primary addtocart" onclick="Util.addtocart({{$row->id}}, $('#ST-QTY').val())">
                                    <span class="glyphicon glyphicon-shopping-cart"></span>@lang('ADD TO CART')
                                </button>
                                <button class="btn btn-info buynow" onclick="Util.buyNow({{$row->id}}, $('#ST-QTY').val())">
                                    <span class="glyphicon glyphicon-hand-right"></span>@lang('Buy Now')
                                </button>
                                <button class="btn btn-default addtowishlist" onclick="Util.addToWishList({{$row->id}})">
                                    <span class="glyphicon @if($row->is_collected)glyphicon-heart @else glyphicon-heart-empty @endif"></span>@lang('Add to wish list')
                                </button>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="st-h50"></div>
    <div class="container">
        <div class="st-main-detail">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#Details" role="tab" data-toggle="tab" class="bi-stickies"> @lang('Details')</a></li>
                @if(!empty($row->related_accessories_sku))
                <li role="presentation"><a href="#Accessories"role="tab" data-toggle="tab" class="bi-tools"> @lang('Accessories')</a></li>
                @endif
                <li role="presentation"><a href="#Delivery"role="tab" data-toggle="tab" class="bi-map"> @lang('Delivery & Tax')</a></li>
                <li role="presentation"><a href="#Returns" role="tab" data-toggle="tab" class="bi-bootstrap-reboot"> @lang('Returns')</a></li>
                <!--<li role="presentation"><a href="#Reviews" role="tab" data-toggle="tab" class="bi-emoji-smile"> @lang('Reviews')</a></li>-->
            </ul>
            <!-- Tab panes -->
            <div class="tab-content">
                <div class="st-h10"></div>
                <div role="tabpanel" class="tab-pane active" id="Details">
                    {!!$row->details!!}
                </div>
                @if(!empty($row->related_accessories_sku))
                <div role="tabpanel" class="tab-pane" id="Accessories">
                    <table class="table st-cart-table">
                        <tbody>
                            @foreach($row->related_accessories_sku as $related_accessory)
                            <tr>
                                <td>
                                    <div class="media">
                                        <div class="media-left">
                                            <a href="{{route('product.show', ['id'=>$related_accessory->id])}}">
                                                <img class="media-object" src="{{$related_accessory->img_cover}}" alt="{{$related_accessory->title}}" title="{{$related_accessory->title}}" />
                                            </a>
                                        </div>
                                        <div class="media-body">
                                            <h5 class="media-heading"><a href="{{route('product.show', ['id'=>$related_accessory->id])}}">{{$related_accessory->title}}</a></h5>
                                            <p class="st-itemcode"> <small>@lang('Item code #'): {{$related_accessory->sku}}</small></p>
                                            <p class="st-price">
                                                {{$_current_currency_name}} {{$related_accessory->sale_price}} x 
                                                <input value="1" name='accNum' type="number" />
                                            </p>
                                        </div>
                                    </div>
                                </td>
                                <td class="st-wholesale hidden-xs">
                                    <table class="table">
                                        <tbody>
                                            @foreach($related_accessory->wholesale_set['num'] as $wholesale_num)
                                            <tr>
                                                <td>
                                                    @if($loop->last) <font>≥</font> @else <font>≥</font> @endif
                                                    {{$wholesale_num}}
                                                </td>
                                                <td>{{$_current_currency_name}} {{$related_accessory->wholesale_set['price'][$loop->index]}}</td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </td>
                                <td>
                                    <button onclick="Util.addtocart({{$related_accessory->id}}, $(this).parentsUntil('tr').siblings().find('input[name=accNum]').val());$(this).children('i').removeClass('bi-cart').addClass('bi-cart-fill');" class="btn btn-default btn-xs"> 
                                        <i class="bi-cart"></i> 
                                        <span class="hidden-xs">@lang('Add to cart')</span>
                                        <span class="visible-xs-inline">@lang('Add')</span>
                                    </button>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                @endif
                <div role="tabpanel" class="tab-pane" id="Delivery">
                </div>
                <div role="tabpanel" class="tab-pane" id="Returns">
                </div>
                <div role="tabpanel" class="tab-pane" id="Reviews">
                    <div class="st-main-detail-reviews-header">
                        <h4 class="page-header">
                            197 Ratings
                        </h4>
                        <p>5 stars 59%</p>
                        <p>4 stars 1%</p>
                        <p>3 stars 20%</p>
                        <p>2 stars 33%</p>
                        <p>1 stars 0%</p>
                    </div>
                    <div class="st-main-detail-reviews-content">
                        <dl>
                            <dt>
                                <font>Bob</font> <span><i class="bi-star-fill"></i><i class="bi-star-fill"></i><i class="bi-star-half"></i></span>
                            </dt>
                            <dd class="st-text">This is a beautiful stuff.</dd>
                            <dd class="st-datetime">2021.03.06 12:00</dd>
                        </dl>
                        <dl>
                            <dt>
                                <font>Bob</font> <span><i class="bi-star-fill"></i><i class="bi-star-fill"></i></span>
                            </dt>
                            <dd class="st-text">This is a beautiful stuff.</dd>
                            <dd class="st-datetime">2021.03.06 12:00</dd>
                        </dl>
                        <dl>
                            <dt>
                                <font>Bob</font> <span><i class="bi-star-fill"></i><i class="bi-star-fill"></i><i class="bi-star-half"></i></span>
                            </dt>
                            <dd class="st-text">This is a beautiful stuff.</dd>
                            <dd class="st-datetime">2021.03.06 12:00</dd>
                        </dl>
                    </div>
                    <div class="st-main-detail-reviews-write">
                        <form class="form-horizontal" style="padding: 15px;">
                            <div class="form-group">
                                <label>@lang('First Name')</label>
                                <input type="text" class="form-control" placeholder="@lang('First Name')">
                            </div>
                            <div class="form-group">
                                <label>@lang('Last Name')</label>
                                <input type="email" class="form-control" placeholder="@lang('Last Name')">
                            </div>
                            <div class="form-group">
                                <label>@lang('Comment Content')</label>
                                <textarea class="form-control" rows="3" placeholder="@lang('Comment Content')"></textarea>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-warning">@lang('Submit')</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@push('scripts_bottom')
<script src="{{ asset('vendor/swiper/swiper-bundle.min.js') }}"></script>
<script>
!function () {
    //产品放大镜
    Util.zoomImage();
    //移动端产品轮播
    if(Util.isIE() === false){
        new Swiper('.swiper-container', {
            pagination: {
                el: '.swiper-pagination'
            }
        });
    }
    /**
     * 规格提示
     * bootstrap3 - JavaScript 插件 - 工具提示 https://v3.bootcss.com/javascript/#tooltips
     */
    $('[data-toggle="tooltip"]').tooltip();
    
    //当前产品规格
    var specs = @json($row->specs);
    var currSpecs = [];
    for (x in specs)
    {
        currSpecs[x] = specs[x].pivot.spec_value;
    }
    currSpecs.sort();
    console.log('currSpecs', currSpecs);
    //spu产品规格
    var spuSpecs = @json($row->spu_specs);
    //产品规格选择
    $(".st-detail-attr > dl.st-attr > dd").click(function () {
        if ($(this).hasClass('active')) {
            $(this).removeClass('active');
            $(this).parent().removeClass('active');
            $(this).parent().parent().find("dl>dd").removeClass('st-invalid');
        } else {
            $(this).addClass('active').siblings('dd').removeClass('active');
            $(this).parent().addClass('active');
        }
        //获取已选规格
        var selectedSpecs = [],n=0;
        $(this).parent().parent().children("dl.st-attr").each(function () {
            var childActiveObj = $(this).children('dd.active');
            if(typeof(childActiveObj.attr('data-spec')) != "undefined"){
                selectedSpecs[n] = childActiveObj.attr('data-spec');
                n++;
                $(this).addClass('active');
            }else{
                $(this).removeClass('active');
            }
        });
        console.log(selectedSpecs);
        //如果还剩一种规格未选 则 标记出无效的规格
        if((currSpecs.length-selectedSpecs.length) === 1){
            $(this).parent().parent().children("dl.st-attr:not(.active)").children('dd').each(function (i) {
                var dataSpecVal = $(this).attr('data-spec');
                selectedSpecs.push(dataSpecVal);
                selectedSpecs.sort();
                console.log('selectedSpecs----',selectedSpecs);
                //匹配无效规格
                for (x in spuSpecs)
                {
                    if (selectedSpecs.toString() === spuSpecs[x].spec_values.sort().toString()) {
                        $(this).removeClass('st-invalid');
                        break;
                    }else{
                        $(this).addClass('st-invalid');
                    }
                }
                var indSpec = selectedSpecs.indexOf(dataSpecVal);
                selectedSpecs.splice(indSpec,1);
            });
        }
        //如果规格还未全部选完
        if(selectedSpecs.length !== currSpecs.length){
            console.log('selectedSpecs.length !== currSpecs.length', selectedSpecs.length, currSpecs.length);
            return;
        }
        selectedSpecs.sort();
        console.log('selectedSpecs', selectedSpecs.length, selectedSpecs.toString());
        //如果所选规格和当前规格相同
        if (currSpecs.toString() === selectedSpecs.toString()) {
            return;
        }
        //匹配所选规格
        for (x in spuSpecs)
        {
            if (selectedSpecs.toString() === spuSpecs[x].spec_values.sort().toString()) {
                //如果匹配到则重定向到该产品详情
                window.location.href = '/product?id=' + spuSpecs[x].product_id;
                return;
            }
        }
        $(this).removeClass('active').addClass('st-invalid');
        //$(this).attr('data-original-title', 'Invalid 无效').tooltip('show');
    });
}
();
</script>
@endpush