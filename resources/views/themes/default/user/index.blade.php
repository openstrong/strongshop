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
                <div class="panel panel-default st-user-info">
                    <div class="panel-body">
                        <div>
                            @if(!auth()->user()->hasVerifiedEmail())
                            <div class="alert alert-warning" role="alert">
                                <button type="button" class="btn btn-link p-0 m-0 align-baseline" onclick="Util.resendEmailVerify();">{{ __('Verify Your Email Address') }}</button>
                            </div>
                            @endif

                            <div class="page-header">
                                <h4>{{auth()->user()->first_name}} <small>@lang('Welcome back to :shop！',['shop'=>config('strongshop.storeName')])</small></h4>
                            </div>
                            <dl>
                                <dt>@lang('Account')</dt>
                                <dd>@lang('Credits'): 3628 @lang('Credits')</dd>
                                <dd><a href="#">@lang('About Credits?')</a></dd>
                            </dl>
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
