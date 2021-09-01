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
                <div class="panel panel-default st-user-feedback">
                    <div class="panel-body table-responsive">
                        <div class="page-header">
                            <h4>@lang('My Feedaback')</h4>
                        </div>
                        <div class="st-user-feedback-list">
                            <p><a class="btn btn-primary btn-sm"  href="{{route('user.my.feedback.create')}}">@lang('Submit New Feedback')</a></p>
                            @foreach($rows as $row)
                            <dl>
                                <dt>
                                    <a href="{{route('user.my.feedback.reylies', ['parent_id'=>$row->id])}}">
                                        @if($row->unread_replies_count>0)
                                        <span class="badge">{{$row->unread_replies_count}}</span> 
                                        @endif
                                        <font>{{$row->title}}</font>
                                    </a>
                                </dt>
                                <dd class="st-text"></dd>
                                <dd class="st-datetime">{{$row->created_at}}</dd>
                                @if($row->content_reply)
                                <dd class="st-reply">
                                    <dl>
                                        <dd class="st-text">{{$row->content_reply}}</dd>
                                        <dd class="st-datetime">{{$row->updated_at}} <strong>Admin</strong></dd>
                                    </dl>
                                </dd>
                                @endif
                            </dl>
                            @endforeach
                        </div>
                        <ul class="pager pull-left">
                            @if($rows->onFirstPage())
                            <li class="disabled"><a href="javascript:void(0)">@lang('Previous')</a></li>
                            @else
                            <li><a href="{{$rows->previousPageUrl()}}">@lang('Previous')</a></li>
                            @endif
                            @if($rows->hasMorePages())
                            <li><a href="{{$rows->nextPageUrl()}}">@lang('Next')</a></li>
                            @else
                            <li class="disabled"><a href="javascript:void(0)">@lang('Next')</a></li>
                            @endif
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="st-h20"></div>

</div>

<div class="st-h50 clearfix"></div>
@endsection
