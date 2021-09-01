@extends('layouts.app')

@section('content')
@include('layouts.includes.breadcrumb')
<div class="st-main">
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <!--主体左侧-->
                <div class="st-main-left hidden-xs">
                    <!--筛选-产品分类-->
                    <div class="st-main-left-category">
                        <!--<h5>@lang('Categories')</h5>-->
                        @foreach($_categories as $category)
                        <dl>
                            <!-- List 一级分类 -->
                            <dt @if(request('catid')==$category->id)class="active" @endif><a href="{{route('product.list.rewrite', ['catid'=>$category->id])}}">{{$category->name}}</a></dt>
                            @foreach($category->children as $child)
                            <dd>
                                <dl>
                                    <!--二级分类-->
                                    <dt @if(request('catid')==$child['id'])class="active" @endif><a href="{{route('product.list.rewrite', ['catid'=>$child['id']])}}">{{$child['name']}}</a></dt>
                                    @foreach($child['children'] as $childChild)
                                    <!--三级分类-->
                                    <dd @if(request('catid')==$childChild['id'])class="active" @endif><a href="{{route('product.list.rewrite', ['catid'=>$childChild['id']])}}">{{$childChild['name']}}</a></dd>
                                    @endforeach
                                </dl>
                            </dd>
                            @endforeach
                        </dl>
                        @endforeach
                    </div>
                    <!--筛选-价格-->
                    <div class="st-main-left-price">
                        <h5>@lang('Price')</h5>
                        @foreach($filterPrices as $filterPrice)
                        @if($loop->last)
                        <div class="checkbox">
                            <a href="{{request()->fullUrlWithQuery(['price' => ['min' => (request('price.min')!==null?null:$filterPrice['max']), 'max' => null]])}}">
                                <i class="glyphicon @if(request('price.min')==$filterPrice['max'] && request('price.max')==null) glyphicon-check  @else glyphicon-unchecked @endif"></i>
                                &ge; {{$filterPrice['maxLabel']}}
                            </a>
                        </div>
                        @else
                        <div class="checkbox">
                            <a href="{{request()->fullUrlWithQuery(['price' => ['min' => (request('price.min')!==null?null:$filterPrice['min']), 'max' => (request('price.max')!==null?null:$filterPrice['max'])]])}}">
                                <i class="glyphicon @if(request('price.min')==$filterPrice['min'] && request('price.max')==$filterPrice['max']) glyphicon-check  @else glyphicon-unchecked @endif"></i>
                                {{$filterPrice['minLabel']}} - {{$filterPrice['maxLabel']}}
                            </a>
                        </div>
                        @endif
                        @endforeach

                    </div>
                    <!--筛选-库存状态-->
                    <div class="st-main-left-stock">
                        <h5>@lang('Stock Status')</h5>
                        <div class="checkbox">
                            <a href="{{request()->fullUrlWithQuery(['stock' => request('stock') ? null : 1])}}">
                                <i class="glyphicon @if(request('stock')==1) glyphicon-check  @else glyphicon-unchecked @endif"></i> @lang('In Stock')
                            </a>
                        </div>
                        <div class="checkbox">
                            <a href="{{request()->fullUrlWithQuery(['stock' => request('stock') ? null : 2])}}">
                                <i class="glyphicon @if(request('stock')==2) glyphicon-check  @else glyphicon-unchecked @endif"></i> @lang('Stockout')
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9">
                <!--主体右侧-->
                <div class="st-main-right st-main-product">
                    <div class="st-main-product-header">
                        <!--排序-->
                        <div class="st-main-product-header-sortby pull-left">
                            @lang('Sort By'):
                            <select>
                                <option>@lang('default')</option>
                                <option value="1" @if(request('sortBy')==1)selected @endif>@lang('Lowest Price')</option>
                                <option value="2" @if(request('sortBy')==2)selected @endif>@lang('Highest Price')</option>
                                <option value="3" @if(request('sortBy')==3)selected @endif>@lang('Best Views')</option>
                                <option value="4" @if(request('sortBy')==4)selected @endif>@lang('Best Selling')</option>
                            </select>
                        </div>
                        <!--移动端*隐藏-->
                        <div class="st-main-product-header-pager pull-right hidden-sm">
                            <!--分页-->
                            <nav aria-label="Page navigation">
                                {{$rows->links()}}
                            </nav>
                        </div>
                        <!--移动端*显示-->
                        <div class="st-main-product-header-filter pull-right visible-xs-block">
                            <span>@lang('Filter')</span>
                            <div id="FILTER">
                                <span class="bi-x-square st-close"></span>
                                <!--筛选-价格-->
                                <div class="st-main-product-header-filter-price">
                                    <h5>@lang('Price')</h5>
                                    @foreach($filterPrices as $filterPrice)
                                    @if($loop->last)
                                    <div class="checkbox">
                                        <a href="{{request()->fullUrlWithQuery(['price' => ['min' => (request('price.min')!==null?null:$filterPrice['max']), 'max' => null]])}}">
                                            <i class="glyphicon @if(request('price.min')==$filterPrice['max'] && request('price.max')==null) glyphicon-check  @else glyphicon-unchecked @endif"></i>
                                            &ge; {{$filterPrice['maxLabel']}}
                                        </a>
                                    </div>
                                    @else
                                    <div class="checkbox">
                                        <a href="{{request()->fullUrlWithQuery(['price' => ['min' => (request('price.min')!==null?null:$filterPrice['min']), 'max' => (request('price.max')!==null?null:$filterPrice['max'])]])}}">
                                            <i class="glyphicon @if(request('price.min')==$filterPrice['min'] && request('price.max')==$filterPrice['max']) glyphicon-check  @else glyphicon-unchecked @endif"></i>
                                            {{$filterPrice['minLabel']}} - {{$filterPrice['maxLabel']}}
                                        </a>
                                    </div>
                                    @endif
                                    @endforeach
                                </div>
                                <!--筛选-库存状态-->
                                <div class="st-main-product-header-filter-stock">
                                    <h5>@lang('Stock Status')</h5>
                                    <div class="checkbox">
                                        <a href="{{request()->fullUrlWithQuery(['stock' => request('stock') ? null : 1])}}">
                                            <i class="glyphicon @if(request('stock')==1) glyphicon-check  @else glyphicon-unchecked @endif"></i> In Stock
                                        </a>
                                    </div>
                                    <div class="checkbox">
                                        <a href="{{request()->fullUrlWithQuery(['stock' => request('stock') ? null : 2])}}">
                                            <i class="glyphicon @if(request('stock')==2) glyphicon-check  @else glyphicon-unchecked @endif"></i> Oversold
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <!--产品列表-->
                    <div class="row">
                        @foreach($rows as $row)
                        <div class="col-xs-6 col-sm-4 col-md-3">
                            <div class="thumbnail">
                                <a href="{{route('product.show.rewrite', ['id'=>$row->id])}}" class="st-thumb">
                                    <img alt="{{$row->title}}" title="{{$row->title}}" src="{{$row->img_cover}}" class="img-responsive" />
                                </a>
                                <div class="caption">
                                    <h5 title="{{$row->title}}"><a href="{{route('product.show.rewrite', ['id'=>$row->id])}}">{{$row->title}}</a></h5>
                                    <p class="st-home-product-price">{{$_current_currency_name}} {{$row->sale_price}}</p>
                                    <p class="st-home-product-sold">{{$row->click_num}} @lang('clicks')</p>
                                </div>
                                <div class="st-home-product-addcart">
                                    <button class="btn btn-primary" onclick="Util.addtocart({{$row->id}}, 1)">@lang('ADD TO CART')</button>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                    <!--分页-->
                    <nav aria-label="Page navigation">
                        {{$rows->links()}}
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@push('scripts_bottom')
<script>
    !function () {

        //排序
        $(".st-main-product-header-sortby select").change(function () {
            var val = $(this).val();
            window.location.href = Util.setUrlParam(window.location.href, 'sortBy', val);
        });
        //移动端*筛选
        $(".st-main-product-header-filter").click(function () {
            $("#FILTER").slideDown('fast');
        });
        //移动端*关闭筛选
        $("#FILTER .st-close").click(function (event) {
            $("#FILTER").slideUp('fast');
            event.stopPropagation();
        });
    }
    ();
</script>
@endpush