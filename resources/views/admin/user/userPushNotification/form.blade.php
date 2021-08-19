@extends('admin.layouts.app')

@push('styles')
<style></style>
@endpush

@push('scripts')
<script></script>
@endpush

@section('content')
<div class="st-h15"></div>
<form class="layui-form" action="">
    <input name="id" type="hidden" value="{{$model->id}}" />
    <div class="layui-row">
        <div class="layui-col-xs11">
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('title')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="title" value="{{$model->title}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('content')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="content" value="{{$model->content}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
<!--            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('send_at')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="send_at" value="{{$model->send_at}}" autocomplete="off" placeholder="" class="layui-input" id="sendtime" placeholder="年-月-日">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>-->
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('status')}}</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="1" title="正常发送" @if($model->status==1)checked @endif>
                    <input type="radio" name="status" value="2" title="取消发送" @if($model->status==2)checked @endif>
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
        layui.laydate.render({
            elem: '#sendtime',
            type: 'datetime'
        });
    }();
</script>
@endpush
