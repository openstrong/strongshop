<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="renderer" content="webkit">
        <meta name="keywords" content="{{$_meta_keywords ?? ''}}">
        <meta name="description" content="{{$_meta_description ?? ''}}">
        <!-- CSRF Token -->
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>@if(isset($_title)){{$_title}} - {{ config('strongshop.storeName') }}@else {{app('strongshop')->getShopConfig('store_title')}} @endif</title>
        <!-- Styles -->
        <link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}">
        <link rel="stylesheet" href="{{ asset('css/bootstrap-theme.min.css') }}">
        <link rel="stylesheet" href="{{ asset('css/bootstrap-icons.css') }}">
        <link rel="stylesheet" href="{{ asset('css/main.css') }}?v={{env('APP_VERSION')}}">
        <!-- Scripts 兼容 ie8 自适应 -->
        <script src="{{ asset('js/vendor/modernizr-2.8.3-respond-1.4.2.min.js') }}"></script>
        @stack('styles')
        @stack('scripts')
    </head>
    <body id="app" class="st">
        <!--顶部-提示信息-->
        <div class="st-navtip">
            @if(!isset($_COOKIE['strongshop_browserOutdated']))
            <!--[if lte IE 8]>
            <div class="container">
                <div class="alert alert-warning alert-dismissible fade in" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <p data-cookie="strongshop_browserOutdated">You are using an <strong>outdated</strong> browser. Please <a href="https://www.google.com/chrome/">upgrade your browser</a> to improve your experience.</p>
                </div>
            </div>
            <![endif]-->
            @endif
            @if(app('strongshop')->getShopConfig('notice') && !isset($_COOKIE['strongshop_notice']))
            <div class="container">
                <div class="alert alert-warning alert-dismissible fade in" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <p data-cookie="strongshop_notice">{!! app('strongshop')->getShopConfig('notice') !!}</p>
                </div>
            </div>
            @endif
        </div>
        <!--导航区域-顶部 * 移动端隐藏-->
        <div class="st-navtop hidden-xs">
            <div class="container">
                <ul class="nav nav-pills pull-left st-navtop-items">
                    @if(empty($_languages))
                    <li>
                        <div id="st-google-translate-element"></div>
                    </li>
                    @else
                    <li class="dropdown st-navtop-items-account">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-globe"></i>
                            <font>{{app('strongshop')->getCurrentLanguageName()}}</font><span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            @foreach($_languages as $lang)
                            <li @if($lang['code'] == app('strongshop')->getCurrentLanguage()) class="active" @endif>
                                <a rel="nofollow" href="{{request()->fullUrlWithQuery(['locale'=>$lang['code']])}}" rel="nofollow">{{$lang['name']}}</a>
                            </li>
                            @endforeach
                        </ul>
                    </li>
                    @endif
                    <li class="dropdown st-navtop-items-account">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <font>{{$_current_currency_name}}</font>
                            <!--<span class="caret"></span>-->
                            <span aria-hidden="true" style="color: rgb(118, 118, 118);">▼</span>
                        </a>
                        <ul class="dropdown-menu">
                            @foreach($_currencies as $currency)
                            <li @if($currency['code'] == app('strongshop')->getCurrentCurrency()) class="active" @endif>
                                <a rel="nofollow" href="{{request()->fullUrlWithQuery(['currency'=>$currency['code']])}}" rel="nofollow">{{$currency['name']}}</a>
                            </li>
                            @endforeach
                        </ul>
                    </li>
                </ul>
                <ul class="nav nav-pills pull-right st-navtop-items">
                    <li>
                        <a href="{{route('user.my.feedback')}}" rel="nofollow">
                            <i class="glyphicon glyphicon-question-sign"></i><font>@lang('Feedback Us')</font>
                        </a>
                    </li>
                    <li>
                        <a href="{{route('user.orderTracking')}}" rel="nofollow">
                            <i class="glyphicon glyphicon-map-marker"></i><font>@lang('Order Tracking')</font>
                        </a>
                    </li>
                    <li class="hidden-sm">
                        <a href="{{route('shoppingcart')}}" rel="nofollow">
                            <i class="glyphicon glyphicon-shopping-cart"></i>
                            <font>@lang('Shopping Cart')
                            (<span class="st-cartnum">@if($_cart['total']['cart_qty_total']>99)99+@else{{$_cart['total']['cart_qty_total']}}@endif</span>)
                            </font>
                        </a>
                    </li>
                    <li>
                        <a href="{{route('user.my.collects')}}" rel="nofollow">
                            <i class="glyphicon glyphicon-heart-empty"></i><font>@lang('Wish List')(<span id="ST-WISH-LIST-TOTAL">{{$_wish_list_total}}</span>)</font>
                        </a>
                    </li>
                    @guest
                    <li>
                        <a href="{{route('login')}}" rel="nofollow">
                            <i class="glyphicon glyphicon-log-in"></i><font>@lang('Sign in')</font>
                        </a>
                    </li>
                    @endguest
                    <li class="dropdown st-navtop-items-account">
                        <a href="{{route('user.index')}}" class="dropdown-toggle" data-hover="dropdown">
                            <i class="glyphicon glyphicon-user"></i>
                            <font>@lang('My Account')
                            @auth
                            ({{auth()->user()->nickname}})
                            <span class="badge">{{$_unread_feedback_replies_total}}</span>
                            @endauth
                            </font>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            @guest
                            <li><a href="{{route('login')}}" rel="nofollow">@lang('Sign in')</a></li>
                            <li><a href="{{route('register')}}" rel="nofollow">@lang('Sign up')</a></li>
                            <li role="separator" class="divider"></li>
                            @endguest
                            <li><a href="{{route('user.index')}}" rel="nofollow">@lang('User Home')</a></li>
                            <li><a href="{{route('user.my.orders')}}" rel="nofollow">@lang('My Orders')</a></li>
                            <li><a href="{{route('user.my.collects')}}" rel="nofollow">@lang('My Wish List')</a></li>
                            <li><a href="{{route('user.my.feedback')}}" rel="nofollow">@lang('My Feedback') <span class="badge">{{$_unread_feedback_replies_total}}</span></a></li>
                            @auth
                            <li role="separator" class="divider"></li>
                            <li><a rel="nofollow" href="{{route('logout')}}"><i class="glyphicon glyphicon-log-out"></i><font>@lang('Sign out')</font></a></li>
                            @endauth
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!--导航区域-品牌、搜索和购物车 * 移动端隐藏-->
        <div class="st-navbrand hidden-xs">
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="st-navbrand-logo">
                            <a href="/"><img src="{{ asset('img/logo.272x92.png') }}"class="img-responsive" alt="{{config('app.name')}}"  title="{{config('app.name')}}" /></a>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <!--<div class="st-navbrand-slogan hidden-sm">@lang('Slogan')</div>-->
                    </div>
                    <div class="col-sm-5">
                        <form id="ST-SEARCH" method="get" action="{{route('product.list')}}">
                            <div class="input-group st-navbrand-search">
                                <input name="keywords" type="text" class="form-control" placeholder="@lang('Search Products')" required="required" value="{{request('keywords')}}" />
                                <div class="input-group-addon" onclick="document.getElementById('ST-SEARCH').submit();">
                                    <i class="glyphicon glyphicon-search"></i>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-sm-2">
                        <div id="ST-NAVCART-ICON"  class="st-navbrand-cart pull-right">
                            <a rel="nofollow" href="{{route('shoppingcart')}}"><i class="glyphicon glyphicon-shopping-cart"></i>Cart</a>
                            <span class="badge st-cartnum">@if($_cart['total']['cart_qty_total']>99) 99+ @else {{$_cart['total']['cart_qty_total']}} @endif</span>
                        </div>
                        @if(!request()->route()->named(['shoppingcart', 'shoppingcart.checkout']))
                        <!--导航区域-购物车-->
                        <div id="ST-NAVCART-PRODUCTS">
                            <div class="page-header st-navbrand-cart-total">
                                @include('layouts.includes.shoppingcartBtn')
                            </div>
                            <div class="st-navbrand-cart-product-list st-cart-product-list">
                                @include('layouts.includes.shoppingcart')
                            </div>
                        </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
        <!--导航区域-菜单 * 移动端隐藏-->
        <div class="st-navmenu hidden-xs">
            <div class="container">
                <ul class="nav nav-pills">
                    <li id="products">
                        <a href="{{route('product.list')}}">@lang('Product Categories')</a>
                        <div class="st-allcat panel panel-default">
                            <!-- List 一级分类 -->
                            <ul class="list-group st-allcat-items">
                                @foreach($_categories as $category)
                                <li class="list-group-item">
                                    <a href="{{route('product.list.rewrite', ['catid'=>$category->id])}}">
                                        <i class="bi-life-preserver"></i>
                                        <font>{{$category->name}}</font>
                                    </a>
                                </li>
                                @endforeach
                            </ul>
                            <div class="st-allcat-content">
                                @foreach($_categories as $category)
                                <div class="st-allcat-content-item">
                                    @foreach($category->children as $child)
                                    <dl>
                                        <!--二级分类-->
                                        <dt><a href="{{route('product.list.rewrite', ['catid'=>$child->id])}}">{{$child['name']}}</a></dt>
                                        @foreach($child['children'] as $childChild)
                                        <!--三级分类-->
                                        <dd><a href="{{route('product.list.rewrite', ['catid'=>$childChild->id])}}">{{$childChild['name']}}</a></dd>
                                        @endforeach
                                    </dl>
                                    @endforeach
                                </div>
                                @endforeach
                            </div>
                        </div>
                    </li>
                    <li ><a href="/">@lang('Home')</a></li>
                    <li ><a href="#">Women</a></li>
                    <li ><a href="#">Man</a></li>
                    <li ><a href="#">@lang('Promotion')</a></li>
                    <li ><a href="{{route('user.my.feedback')}}">@lang('Feedback Us')</a></li>
                </ul>
            </div>
        </div>
        <!-- 头部导航 * 移动端显示 -->
        <nav class="navbar navbar-default st-header visible-xs-block">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="row">
                    <div class="navbar-header">
                        <div class="col-xs-2">
                            <button type="button" class="navbar-toggle collapsed pull-left" data-toggle="collapse" data-target="#nav-product-categories" aria-expanded="false">
                                <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="col-xs-6">
                            <a class="navbar-brand" href="/">
                                <img src="{{asset('img/logo.272x92.png')}}" class="img-responsive" alt="{{config('app.name')}}"  title="{{config('app.name')}}" />
                            </a>
                        </div>
                        <div class="col-xs-4">
                            <span class="bi bi-person-circle pull-right st-nav-user" data-toggle="collapse" data-target="#nav-user" aria-expanded="true"></span>
                            <a href="{{route('shoppingcart')}}" class="st-header-cart pull-right">
                                <i class="glyphicon glyphicon-shopping-cart"></i>
                                <span class="st-cartnum">@if($_cart['total']['cart_qty_total']>99) 99+ @else {{$_cart['total']['cart_qty_total']}} @endif</span>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="nav-product-categories">
                    <form class="navbar-form" id="ST-SEARCH-M" method="get" action="{{route('product.list')}}">
                        <div class="input-group">
                            <input type="text" name="keywords" class="form-control" placeholder="@lang('Search Products')" required="required" value="{{request('keywords')}}">
                            <div class="input-group-addon" onclick="document.getElementById('ST-SEARCH-M').submit();"><i class="glyphicon glyphicon-search"></i></div>
                        </div>
                    </form>
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">@lang('Product Categories')<span class="caret"></span></a>
                            <ul class="dropdown-menu open st-cat">
                                <!--一级分类-->
                                @foreach($_categories as $category)
                                <li class="dropdown">
                                    <a href="{{route('product.list.rewrite', ['catid'=>$category->id])}}">{{$category->name}}</a>
                                    <ul class="dropdown-menu show st-subcat">
                                        <!--二级分类-->
                                        @foreach($category->children as $child)
                                        <li class="dropdown">
                                            <a href="{{route('product.list.rewrite', ['catid'=>$child->id])}}">{{$child->name}}</a>
                                            <ul class="dropdown-menu show st-subsubcat">
                                                <!--三级分类-->
                                                @foreach($child['children'] as $childChild)
                                                <li><a href="{{route('product.list.rewrite', ['catid'=>$childChild->id])}}">{{$childChild->name}}</a></li>
                                                @endforeach
                                            </ul>
                                        </li>
                                        @endforeach
                                    </ul>
                                </li>
                                @endforeach
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="nav-user">
                    <ul class="nav navbar-nav">
                        <li class="dropdown"><a href="/">@lang('Home')</a></li>
                        @guest
                        <li class="dropdown"><a rel="nofollow" href="{{route('login')}}">@lang('Sign in')</a></li>
                        <li class="dropdown"><a rel="nofollow" href="{{route('register')}}">@lang('Sign up')</a></li>
                        @endguest
                        <li>
                            <a rel="nofollow" href="{{route('user.index')}}">
                                @lang('My Account')
                                @auth
                                ({{auth()->user()->nickname}})
                                @endauth
                            </a>
                        </li>
                        <li><a rel="nofollow" href="{{route('user.my.orders')}}">@lang('My Orders')</a></li>
                        <li><a rel="nofollow" href="{{route('user.my.collects')}}">@lang('My Wish List')</a></li>
                        <li><a rel="nofollow" href="{{route('user.my.feedback')}}">@lang('My Feedback') <span class="badge">{{$_unread_feedback_replies_total}}</span></a></a></li>
                        <li role="separator" class="divider"></li>
                        <li class="dropdown"><a rel="nofollow" href="/article-53.html">@lang('Contact Us')</a></li>
                        <li class="dropdown"><a rel="nofollow" href="{{route('user.my.feedback')}}">@lang('Feedback us')</a></li>
                        <li role="separator" class="divider"></li>
                        @if(!empty($_languages))
                        <li class="dropdown st-navtop-items-account">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-globe"></i>
                                <font>{{app('strongshop')->getCurrentLanguageName()}}</font><span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                @foreach($_languages as $lang)
                                <li @if($lang['code'] == app('strongshop')->getCurrentLanguage()) class="active" @endif>
                                    <a rel="nofollow" href="{{request()->fullUrlWithQuery(['locale'=>$lang['code']])}}">{{$lang['name']}}</a>
                                </li>
                                @endforeach
                            </ul>
                        </li>
                        @endif
                        <li class="dropdown st-navtop-items-account">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <font>{{$_current_currency_name}}</font><span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                @foreach($_currencies as $currency)
                                <li @if($currency['code'] == app('strongshop')->getCurrentCurrency()) class="active" @endif>
                                    <a rel="nofollow" href="{{request()->fullUrlWithQuery(['currency'=>$currency['code']])}}">{{$currency['name']}}</a>
                                </li>
                                @endforeach
                            </ul>
                        </li>
                        @auth
                        <li role="separator" class="divider"></li>
                        <li><a rel="nofollow" href="{{route('logout')}}"><i class="glyphicon glyphicon-log-out"></i><font>@lang('Sign out')</font></a></li>
                        @endauth
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div>
        </nav>

        @include('layouts.includes.errors')

        @yield('content')
        <!--        <div class="st-translate">
                    <div class="st-h100"></div>
                    <div class="container">
                        <p id="google_translate_element" class="pull-right"></p>
                    </div>
                </div>-->
        <!--底部信息-->
        <div class="st-footer">
            <div class="st-footer-service">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-md-3">
                            <dl>
                                <dt>@lang('Services')</dt>
                                <dd><a href="{{route('user.my.feedback')}}">@lang('Feedback')</a><dd>
                                <dd><a href="#">@lang('Privacy & Security')</a><dd>
                            </dl>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <dl>
                                <dt>@lang('Shopping with us')</dt>
                                <dd><a href="#">@lang('Delivery')</a><dd>
                                <dd><a href="#">@lang('Returns')</a><dd>
                            </dl>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <dl>
                                <dt>@lang('Customer Support')</dt>
                                <dd><a href="#">@lang('About us')</a><dd>
                                <dd><a href="#">@lang('Contact us')</a><dd>
                            </dl>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <dl>
                                <dt>@lang('Connect with us')</dt>
                                <dd class="st-footer-service-icon">
                                    <a href="#" >
                                        <i class="bi-facebook"></i>
                                    </a>
                                    <a href="#" >
                                        <i class="bi-instagram"></i>
                                    </a>
                                    <a href="#" >
                                        <i class="bi-pinterest"><svg t="1624281165955" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3033" width="22" height="20"><path d="M512 0.040958c-282.75605 0-511.979521 229.223471-511.979521 511.979521 0 216.895004 134.937323 402.149674 325.393704 476.75533-4.484941-40.50782-8.519339-102.641654 1.781689-146.876685 9.297548-39.954882 60.044958-254.49478 60.044958-254.49478s-15.318427-30.657334-15.318427-75.99824c0-71.185633 41.265549-124.329107 92.647814-124.329107 43.682093 0 64.775649 32.787169 64.775649 72.107196 0 43.927843-27.954082 109.604576-42.412384 170.448222-12.062238 50.972681 25.558018 92.524939 75.813927 92.524939 91.00948 0 160.945882-95.965441 160.945882-234.466141 0-122.588376-88.080957-208.293748-213.864085-208.293748-145.668413 0-231.168993 109.276909-231.168993 222.178633 0 44.00976 16.956762 91.193792 38.091276 116.833727 4.177753 5.078837 4.792128 9.522819 3.542898 14.683573-3.891044 16.178553-12.512779 50.952202-14.212551 58.078957-2.232231 9.358986-7.413463 11.345466-17.120595 6.840046-63.956482-29.776729-103.931843-123.264189-103.931843-198.340866 0-161.49882 117.345706-309.829527 338.275109-309.829527 177.595456 0 315.625135 126.561338 315.625135 295.698892 0 176.448622-111.24291 318.451262-265.655934 318.451262-51.873765 0-100.655174-26.950602-117.345706-58.795728 0 0-25.680893 97.767609-31.886085 121.707772-11.570737 44.460302-42.76053 100.204632-63.649294 134.220551 47.900804 14.826927 98.812048 22.834287 151.607376 22.834287 282.75605 0 511.979521-229.223471 511.979521-511.979521s-229.223471-511.979521-511.979521-511.979521z" p-id="3034" fill="#707070"></path></svg></i>
                                    </a>
                                </dd>
                                <dd class="st-footer-service-signup">
                                    <p>@lang('Sign Up for Our Newsletter'):</p>
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Enter your email">
                                        <span class="input-group-addon" id="basic-addon2">@lang('Subscribe')</span>
                                    </div>
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>
            </div>
            <!--备案信息-->
            <div class="st-footer-beian">
                <div class="container">
                    &copy; {{date('Y')}} {{config('app.name')}} Copyright, All Rights Reserved.
                </div>
            </div>
        </div>
        <!-- Scripts -->
        <script src="{{ asset('js/vendor/jquery-1.11.2.min.js') }}"></script>
        <script src="{{ asset('js/vendor/jquery.form.min.js') }}"></script>
        <script src="{{ asset('js/vendor/jquery.cookie.js') }}"></script>
        <script src="{{ asset('js/vendor/bootstrap.min.js') }}"></script>
        <script src="{{ asset('js/vendor/bootstrap-hover-dropdown.js') }}"></script>
        <script src="{{ asset('js/main.js') }}?v={{env('APP_VERSION')}}"></script>
        @if(env('BlockSimpliedChineseBrowerVisitByJS'))
        <script>
                                if (Util.maybe360Browser()) {
                                    console.log('360Browser');
                                    window.location.href = 'http://www.baidu.com';
                                }
        </script>
        @endif
        <script>
//js 初始化
            Util.init();
//产品分类菜单
            Util.allCategories();
//顶部全局通知手动关闭后不再显示
            Util.navNotice();
//导航区域-购物车(显隐)
            Util.navCart();
        </script>
        @if(empty($_languages))
        <!--谷歌翻译-->
        <script>
            function googleTranslateElementInit() {
                new google.translate.TranslateElement({
                    pageLanguage: '{{ str_replace('_', ' - ', app()->getLocale()) }}',
                    layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
                    gaTrack: true
                }, 'st-google-translate-element');
            }
        </script>
        <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
        @endif
        @stack('scripts_bottom')
    </body>
</html>
