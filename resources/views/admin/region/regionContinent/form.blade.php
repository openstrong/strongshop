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
                <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('iso2')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="iso2" value="{{$model->iso2}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('cn_name')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="cn_name" value="{{$model->cn_name}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('en_name')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="en_name" value="{{$model->en_name}}" autocomplete="off" placeholder="" class="layui-input">
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
