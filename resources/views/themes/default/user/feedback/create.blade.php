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
                        <form class="form-horizontal" method="post" id="ST-FORM" style="padding: 15px;">
                            <div class="form-group">
                                <label class="radio-inline">
                                    <input name="type" type="radio" value="1" checked=""> Buy
                                </label>
                                <label class="radio-inline">
                                    <input name="type" type="radio" value="2"> Complaint 
                                </label>
                                <label class="radio-inline">
                                    <input  name="type"type="radio" value="3"> Other
                                </label>
                            </div>
                            <div class="form-group">
                                <label for="exampleInput"></label>
                                <textarea class="form-control" rows="3" name="content" placeholder="@lang('Content')"></textarea>
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
                Util.showSuccess(res.message);
                $("#ST-FORM")[0].reset();
            });
            return false;
        });
    }
    ();
</script>
@endpush