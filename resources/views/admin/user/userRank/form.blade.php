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
                <label class="layui-form-label st-form-input-required"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('name')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="name" value="{{$model->name}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('min_credits')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="min_credits" value="{{$model->min_credits}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('max_credits')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="max_credits" value="{{$model->max_credits}}" autocomplete="off" placeholder="" class="layui-input">
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
