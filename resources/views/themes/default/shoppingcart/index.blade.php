@extends('layouts.app')

@section('content')
@include('layouts.includes.breadcrumb')
<!--主体区域-->
<div class="st-cart">
    <div class="container">
        <div class="row">
            <!--购物车-->
            <div class="col-md-8">
                <div class="page-header">
                    <h4>@lang('Shopping Cart') <button class="btn btn-default btn-xs pull-right" onclick="history.back();">@lang('Go back to add more')</button></h4>
                </div>
                <div id="ST-SHOPPINGCART" class="st-cart-product-list">
                    @include('layouts.includes.shoppingcart')
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default st-cart-checkout">
                    @include('layouts.includes.shoppingcartBtn')
                </div>
            </div>
        </div>
    </div>
    <div class="st-h20"></div>

</div>

<div class="st-h50 clearfix"></div>
@endsection
@push('scripts_bottom')
<script>
    !function () {
        var a = $(".st-cart-checkout").offset().top;
        var cw = document.body.clientWidth;
        if (cw < 992) {
            return;
        }
        $(window).scroll(function (event) {
            var b = $(window).scrollTop();
            //console.log(a, b);
            if (b >= a) {
                $(".st-cart-checkout").addClass('st-fixed');
            } else {
                $(".st-cart-checkout").removeClass('st-fixed');
            }
        });
    }();
</script>
@endpush