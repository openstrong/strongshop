@extends('layouts.app')

@section('content')
<div class="st-signin">
    <div class="container">
        <div class="col-sm-6">
            <div class="page-header">
                <h4>@lang('Registered Customers')</h4>
            </div>
            <form class="form-horizontal" method="post" id="ST-FORM">
                @csrf
                <input name='redirectTo' type='hidden' value="{{$redirectTo}}">
                <input name='way' type='hidden' value="{{request('way', 'password')}}">
                <div class="form-group">
                    <label class="col-md-2 control-label">@lang('Email')</label>
                    <div class="col-md-10">
                        <input name='username' type="email" class="form-control" placeholder="@lang('Email')" value="{{old('email')}}" required>
                    </div>
                </div>
                @if(request('way')==='code')
                <div class="form-group">
                    <label class="col-md-2 control-label">@lang('Code')</label>
                    <div class="col-md-5">
                        <input name="code" type="text" class="form-control" placeholder="@lang('Verification Code')" >
                        <div class="st-h10"></div>
                    </div>
                    <div class="col-md-5">
                        <a class="btn btn-primary btn-sm" style="width: 100%;" id="SecurityCode">@lang('Get Verification Code')</a>
                    </div>
                </div>
                @else
                <div class="form-group">
                    <label class="col-md-2 control-label">@lang('Password')</label>
                    <div class="col-md-10">
                        <input name="password" type="password" class="form-control" placeholder="@lang('Password')" >
                    </div>
                </div>
                @endif
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <div class="checkbox">
                            <label>
                                <input name="remember" type="checkbox" value="1" checked> @lang('Remember Me')
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <button type="submit" class="btn btn-primary">@lang('Sign in')</button>
                        <div class="st-h20"></div>
                        <p><a href="{{route('password.request')}}">@lang('Forgot Your Password?')</a></p>
                        @if(request('way')==='code')
                        <p><a href="{{route('login')}}">@lang('Sign in with password.')</a></p>
                        @else
                        <p><a href="{{route('login', ['way'=>'code'])}}">@lang('Sign in with email security code.')</a></p>
                        @endif
                    </div>
                </div>
            </form>
        </div>
        <div class="col-sm-6">
            <div class="page-header">
                <h4>@lang('New Customers')</h4>
            </div>
            <p>@lang('You will have many benefits after creating a new account.')</p>
            <a class="btn btn-warning" href="{{route('register')}}">@lang('Sign up')</a>
        </div>
    </div>
</div>
@endsection
@push('scripts_bottom')
<script>
    !function () {
        $("button[type='submit']").click(function () {
            $('#ST-FORM').ajaxSubmit(function (res) {
                if (res.code !== 200) {
                    Util.showErrors(res.message);
                    return;
                }
                var redirectTo = $("input[name='redirectTo']").val();
                window.location.href = redirectTo ? redirectTo : '/';
                return;
            });
            return false;
        });
        $("#SecurityCode").click(function () {
            var username = $("input[name=username]").val();
            $.post('/login/code', {username: username}, function (res) {
                if (res.code !== 200) {
                    Util.showErrors(res.message);
                    return;
                }
                Util.showSuccess(res.message, false, 10000);
            });
        });
    }
    ();
</script>
@endpush
