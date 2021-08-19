@extends('layouts.app')

@section('content')
<div class="container" style="min-height: 300px;">
    <div class="st-h20"></div>
    <div class="alert alert-success" role="alert">
        <p>{{ $exception->getMessage() }}</p>
        <p>
            <a href="/" class="btn btn-default btn-xs">@lang('Go Home')</a>
        </p>
    </div>
</div>
@endsection