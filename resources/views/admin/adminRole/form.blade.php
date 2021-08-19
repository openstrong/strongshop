@extends('admin.layouts.app')

@push('styles')
<style></style>
@endpush

@push('scripts')
<script></script>
@endpush

@section('content')
<div class="st-h15"></div>
<form class="layui-form" action="" lay-filter="ST-FORM" id="ST-FORM">
    <input name="id" type="hidden" value="{{$model->id}}" />
    <input name="level" type="hidden" value="{{$model->level}}" />
    <input name="parent_id" type="hidden" value="{{$model->parent_id}}" />
    <div class="layui-row">
        <div class="layui-col-xs11">
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('name')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="name" value="{{$model->name}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip st-form-tip-error"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('desc')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="desc" value="{{$model->desc}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip st-form-tip-error"></div>
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
        //监听提交
        layui.form.on('submit(ST-SUBMIT)', function (data) {
            Util.postForm('#ST-FORM', data.field, true);
            return false;
        });
    }();
</script>
@endpush
