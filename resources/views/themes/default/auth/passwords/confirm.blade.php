@extends('layouts.app')

@section('content')
<div class="st-signin">
    <div class="container">
        <div class="col-sm-6">
            <div class="page-header">
                <h4>{{ __('Confirm Password') }}</h4>
            </div>
            {{ __('Please confirm your password before continuing.') }}
            <form method="POST" action="{{ route('password.confirm') }}">
                @csrf
                <div class="form-group">
                    <label>{{ __('Password') }}</label>
                    <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">{{ __('Confirm Password') }}</button>
                    @if (Route::has('password.request'))
                    <a class="btn btn-link" href="{{ route('password.request') }}">
                        {{ __('Forgot Your Password?') }}
                    </a>
                    @endif
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
