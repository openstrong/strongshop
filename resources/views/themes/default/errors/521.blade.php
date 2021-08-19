@extends('errors::minimal')

@section('title', __('Service Unavailable'))
@section('code', '521')
@section('message', __($exception->getMessage() ?: 'Service Unavailable'))
