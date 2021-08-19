@extends('layouts.app')
@push('styles')
<style>
    .a-inspector-loader {
        /*padding: 6px 10px;*/
        /*font-size: 12px;*/
        font-family: Roboto,sans-serif;
        text-align: center;
        z-index: 99999;
        width: 100%;
    }
    @keyframes dots-1 {
        from {
            opacity: 0
        }
        25% {
            opacity: 1
        }
    }
    @keyframes dots-2 {
        from {
            opacity: 0
        }
        50% {
            opacity: 1
        }
    }
    @keyframes dots-3 {
        from {
            opacity: 0
        }
        75% {
            opacity: 1
        }
    }
    @-webkit-keyframes dots-1 {
        from {
            opacity: 0
        }
        25% {
            opacity: 1
        }
    }
    @-webkit-keyframes dots-2 {
        from {
            opacity: 0
        }
        50% {
            opacity: 1
        }
    }
    @-webkit-keyframes dots-3 {
        from {
            opacity: 0
        }
        75% {
            opacity: 1
        }
    }
    .a-inspector-loader .dots span {
        animation: dots-1 2s infinite steps(1);
        -webkit-animation: dots-1 2s infinite steps(1);
    }
    .a-inspector-loader .dots span:first-child+span {
        animation-name: dots-2;
        -webkit-animation-name: dots-2;
    }
    .a-inspector-loader .dots span:first-child+span+span {
        animation-name: dots-3;
        -webkit-animation-name: dots-3;
    }
</style>
@endpush

@section('content')
@include('layouts.includes.breadcrumb')
<!--主体区域-->
<div class="container">
    <div class="st-checkout" style="min-height:500px;">
        <div class="st-h50"></div>
        <div class="progress">
            <div class="progress-bar progress-bar-striped active a-inspector-loader" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width:50%;">
                @lang('Processing')
                <span class="dots"><span> . </span><span> . </span><span> . </span></span>
            </div>
        </div>
        <div style="display:none;">
            {!!$def_form!!}
        </div>
        <div class="st-h20"></div>
    </div>
</div>
<div class="st-h50 clearfix"></div>
@endsection
@push('scripts_bottom')
<script>
    !function () {
        var width = 50;
        setInterval(function () {
            width++;
            if (width > 100) {
                return;
            }
            var widthStr = width + '%';
            $('.progress-bar').css({width: widthStr});
        }, 50);
        //自动提交支付
        $('form').submit();
    }
    ();
</script>
@endpush