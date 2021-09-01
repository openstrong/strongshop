@extends('layouts.app')

@section('content')
<div class="st-signin">
    <div class="container">
        <div class="col-sm-5">
            <div class="page-header">
                <h4>{{ __('Reset Password') }}</h4>
            </div>
            <form method="POST" action="{{ route('password.update') }}">
                @csrf
                <input type="hidden" name="token" value="{{ $token }}">
                
                <div class="form-group">
                    <label>{{ __('E-Mail Address') }}</label>
                    <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ $email ?? old('email') }}" required autocomplete="email" autofocus>
                </div>
                <div class="form-group">
                    <label>{{ __('Password') }}</label>
                    <input id="password" type="password" class="form-control" name="password" required autocomplete="new-password">
                </div>
                <div class="form-group">
                    <label>{{ __('Confirm Password') }}</label>
                    <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">{{ __('Reset Password') }}</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
