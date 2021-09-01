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
                    <div class="panel-body table-responsive">
                        <div class="page-header">
                            <h4>
                                @lang('My Account')
                                @if(!request('update'))
                                <a href="{{route('user.my.account', ['update'=>1])}}" class="btn btn-primary btn-xs pull-right">Update</a>
                                @endif
                            </h4>
                        </div>
                        <form class="form-horizontal" method="post" id="ST-FORM" action="{{route('user.my.account.update')}}">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">@lang('Account')</label>
                                <div class="col-sm-10">
                                    <div class="form-control-static">
                                        {{$user->email}} 
                                        @if(!$user->hasVerifiedEmail())
                                        <span class="st-emailnotvalidated">
                                            <i>Email not validated</i>
                                            <button class="btn btn-primary btn-xs" type="button" onclick="Util.resendEmailVerify();">Resend validation email</button>
                                        </span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">@lang('First Name')</label>
                                <div class="col-sm-10">
                                    <input type="text" name="first_name" class="form-control" placeholder="" value="{{$user->first_name}}" @if(!request('update')) disabled @endif>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">@lang('Last Name')</label>
                                <div class="col-sm-10">
                                    <input type="text" name="last_name" class="form-control" placeholder="" value="{{$user->last_name}}" @if(!request('update')) disabled @endif>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">@lang('Country')</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="country_code" @if(!request('update')) disabled @endif>
                                        <option> -- {{__('Country')}} -- </option>
                                        @foreach($countries as $countryCode=>$country)
                                        <option value="{{$countryCode}}" @if($countryCode === $user->country_code) selected @endif>{{$country}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">@lang('Birthday')</label>
                                <div class="col-sm-10">
                                    <input type="date" name="birthday" class="form-control"  placeholder="" value="{{$user->birthday}}" @if(!request('update')) disabled @endif>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">@lang('Gender')</label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" value="0" @if($user->gender==0)checked @endif  @if(!request('update')) disabled @endif> 未知
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" value="1" @if($user->gender==1)checked @endif  @if(!request('update')) disabled @endif> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" value="2"  @if($user->gender==2)checked @endif  @if(!request('update')) disabled @endif> 女
                                    </label>
                                </div>
                            </div>
                            @if(request('update'))
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-primary btn-sm">@lang('submit')</button>
                                </div>
                            </div>
                            @endif
                        </form>
                    </div>
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
        $("button[type='submit']").click(function () {
            $('#ST-FORM').ajaxSubmit(function (res) {
                if (res.code !== 200) {
                    Util.showErrors(res.message);
                    return;
                }
                Util.showSuccess(res.message);
                return;
            });
            return false;
        });
    }
    ();
</script>
@endpush