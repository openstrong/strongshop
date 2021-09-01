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
                        <div class="st-user-feedback-list st-user-feedback-list-replies">
                            <dl>
                                <dd class="st-datetime">{{$feedback->created_at}}</dd>
                                <dd class="st-text">{{$feedback->content}}</dd>
                            </dl>
                            @if($feedback->content_reply)
                            <dl class="st-reply">
                                <dd class="st-datetime"><strong>{{$feedback->adminUser->name ?? ''}}</strong> {{$feedback->updated_at}}</dd>
                                <dd class="st-text">{{$feedback->content_reply}}</dd>
                                <dd class="clearfix"></dd>
                            </dl>
                            @endif
                            @foreach($rows as $row)
                            @if($row->user_id === auth()->id())
                            <dl>
                                <dd class="st-datetime">{{$row->created_at}}</dd>
                                <dd class="st-text">{{$row->content}}</dd>
                            </dl>
                            @else
                            <dl class="st-reply">
                                <dd class="st-datetime"><strong>{{$row->adminUser->name ?? ''}}</strong> {{$row->created_at}}</dd>
                                <dd class="st-text">{{$row->content}}</dd>
                                <dd class="clearfix"></dd>
                            </dl>
                            @endif
                            @endforeach
                        </div>
                        @if($rows->hasPages())
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
                        @endif
                        <div class="clearfix"></div>
                        <form class="form-horizontal" method="post" id="ST-FORM" style="padding: 15px;" action="{{route('user.my.feedback.create')}}">
                            <input type="hidden" name="parent_id" value="{{$feedback->id}}" />
                            <input type="hidden" name="type" value="{{$feedback->type}}" />
                            <div class="form-group">
                                <label for="exampleInput"></label>
                                <textarea class="form-control" rows="3" name="content" placeholder="@lang('Reply content')"></textarea>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">@lang('Submit')</button>
                            </div>
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
                Util.showSuccess(res.message, true, 1000);
                $("#ST-FORM")[0].reset();
            });
            return false;
        });
    }
    ();
</script>
@endpush