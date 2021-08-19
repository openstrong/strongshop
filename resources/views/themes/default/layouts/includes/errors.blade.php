<!--错误信息-->
<div id="st-alert">
    <div class="container st-form-alert" style="display: none;">
        <div class="alert alert-dismissible fade in" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
            <p></p>
        </div>
    </div>
    @if ($errors->any())
    <div class="st-h20"></div>
    <div class="container">
        @foreach ($errors->all() as $error)
        <div class="alert alert-danger alert-dismissible fade in st-form-alert" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
            <p>{{ $error }}</p>
        </div>
        @endforeach
    </div>
    @endif
    @if (session('status'))
    <div class="st-h10"></div>
    <div class="container">
        <div class="alert alert-info" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
            <p>{!! session('status') !!}</p>
        </div>
    </div>
    @endif
</div>