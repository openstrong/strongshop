@extends('admin.layouts.app')

@push('styles')
<style>
    .st-user-feedback-list > dl{
        border-bottom: 1px solid #ddd;
        padding-top: 15px;
    }
    .st-user-feedback-list > dl > dt{
        line-height: 35px;
    }
    .st-user-feedback-list > dl > dt i{
        color:orange;
    }
    .st-user-feedback-list dd.st-datetime{
        color:#666;
        font-size:12px;
        line-height: 25px;
    }
    .st-user-feedback-list > dl > dd.st-reply > dl{
        padding-left: 30px;
        border-top:1px dotted #999;
    }
    .st-user-feedback-list>dl.st-reply{
        text-align: right;
    }
    .st-user-feedback-list-replies>dl{
        border-bottom: none;
        padding-top:0;
        margin-bottom: 10px;
    }
    .st-user-feedback-list-replies>dl>dd.st-text{
        display: inline-block;
        max-width:70%;
        border: 1px solid #eee;
        padding: 5px 10px;
        border-radius: 10px;
        word-break: break-word;
        text-align: left;
    }
    .st-user-feedback-list-replies>dl.st-reply>dd.st-text{
        float:right;
        background: #eee;
    }
</style>
@endpush

@push('scripts')
<script></script>
@endpush

@section('content')
<div class="st-h15"></div>
<div class="layui-row">
    <div class="layui-col-xs11 st-user-feedback-list st-user-feedback-list-replies">
        <dl>
            <dd class="st-datetime"><strong>{{$model->user->first_name ?? ''}}</strong> {{$model->created_at}}</dd>
            <dd class="st-text">{{$model->content}}</dd>
        </dl>
        @if($model->content_reply)
        <dl class="st-reply">
            <dd class="st-datetime"><strong>{{$model->adminUser->name ?? ''}}</strong> {{$model->updated_at}}</dd>
            <dd class="st-text">{{$model->content_reply}}</dd>
            <dd class="layui-clear"></dd>
        </dl>
        @endif
        @foreach($rows as $row)
        @if($row->admin_id > 0)
        <dl class="st-reply">
            <dd class="st-datetime"><strong>{{$row->adminUser->name ?? ''}}</strong> {{$row->updated_at}}</dd>
            <dd class="st-text">{{$row->content}}</dd>
            <dd class="layui-clear"></dd>
        </dl>
        @else
        <dl>
            <dd class="st-datetime"><strong>{{$model->user->first_name ?? ''}}</strong> {{$row->created_at}}</dd>
            <dd class="st-text">{{$row->content}}</dd>
        </dl>
        @endif
        @endforeach
    </div>
</div>
<div class="st-h100"></div>
<form class="layui-form" action="">
    <input name="id" type="hidden" value="{{$model->id}}" />
    <div class="layui-row">
        <div class="layui-col-xs11">
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">邮件通知</label>
                <div class="layui-input-block">
                    <input type="checkbox" checked="" name="emailNotify" lay-skin="switch" lay-text="通知|不通知">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">回复内容</label>
                <div class="layui-input-block">
                    <textarea  name="content"  class="layui-textarea" rows="8"></textarea>
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-form-item st-form-submit-btn">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="ST-SUBMIT">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
@endsection

@push('scripts_bottom')
<script>
    !function () {
        //...
    }();
</script>
@endpush
