@extends('layouts.app')

@section('content')
<div class="st-signin">
    <div class="container">
        <div class="col-sm-6">
            <div class="page-header">
                <h4>{{ __('Reset Password') }}</h4>
            </div>
            <form method="POST" action="{{ route('password.email') }}">
                @csrf
                <div class="form-group">
                    <label>{{ __('E-Mail Address') }}</label>
                    <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">@lang('Submit')</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
