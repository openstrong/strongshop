@extends('layouts.app')

@section('content')
@include('layouts.includes.breadcrumb')
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
            <div class="col-sm-9">
                <div class="st-article-list">
                    @foreach($rows as $row)
                    <div class="media">
                        @if($row->cover_img)
                        <div class="media-left">
                            <a href="{{route('article.show.rewrite', ['id'=>$row->id])}}">
                                <img class="media-object" alt="{{$row->title}}" title="{{$row->title}}" src="{{$row->cover_img}}">
                            </a>
                        </div>
                        @endif
                        <div class="media-body">
                            <h4 class="media-heading"><a href="{{route('article.show.rewrite', ['id'=>$row->id])}}">{{$row->title}}</a></h4>
                            {!!$row->brief!!}
                        </div>
                    </div>
                    @endforeach
                </div>
                <!--分页-->
                <nav aria-label="Page navigation">
                    {{$rows->links()}}
                </nav>
            </div>
        </div>
    </div>
</div>
@endsection
@push('scripts_bottom')
@endpush