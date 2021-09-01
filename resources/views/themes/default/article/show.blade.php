@extends('layouts.app')

@push('styles')
@endpush

@section('content')
@include('layouts.includes.breadcrumb')
<!--主体区域-->
<div class="st-main">
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div class="list-group hidden-xs">
                    @foreach($cats as $cat)
                    <a class="list-group-item @if(request('catid')==$cat->id)active @endif)" href="{{route('article.index', ['catid'=>$cat->id])}}">{{$cat->name}}</a>
                    @endforeach
                </div>
            </div>
            <div class="col-sm-9 st-article">
                <h3>{{$row->title}}</h3>
                <p class="author"><span>Author:{{$row->author}}</span>, <span>{{now()->parse($row->created_at)->toDateString()}}</span></p>
                <hr>
                <div class="st-article-content">
                    {!!$row->content!!}
                </div>
                <p class="st-article-origin text-right"><i class="glyphicon glyphicon-tags"></i> {{$row->origin}}</p>
            </div>
        </div>
    </div>
</div>
<div class="st-h100"></div>
</div>
@endsection
@push('scripts_bottom')
<script>
    !function () {
    }
    ();
</script>

@endpush