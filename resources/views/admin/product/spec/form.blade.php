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
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('spec_group_id')}}</label>
                <div class="layui-input-inline">
                    <select name="spec_group_id">
                        <option value="">请选择</option>
                        @foreach ($specGroups as $specGroup)
                        <option value="{{$specGroup->id}}" @if($model->spec_group_id == $specGroup->id)selected @endif>{{$specGroup->name}}</option>
                        @endforeach
                    </select>   
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
                <div class="layui-input-inline">
                    <a class="layui-btn" onclick="Util.createFormWindow('/admin/product/specGroup/create', this.innerText, ['60%', '60%']);">新建规格组</a>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('name')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="name" value="{{$model->name}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('spec_type')}}</label>
                <div class="layui-input-block">
                    <input type="radio" name="spec_type" value="1" title="价格规格" @if($model->spec_type==1)checked @endif>
                    <input type="radio" name="spec_type" value="2" title="普通规格" @if($model->spec_type==2)checked @endif>
                    <div class="layui-word-aux st-form-tip">价格规格：作为产品价格属性选择。普通规格：作为普通产品参数显示</div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('is_show_img')}}</label>
                <div class="layui-input-block">
                    <input type="radio" name="is_show_img" value="1" title="显示" @if($model->is_show_img==1)checked @endif>
                    <input type="radio" name="is_show_img" value="2" title="不显示" @if($model->is_show_img==2)checked @endif>
                    <div class="layui-word-aux st-form-tip">在产品详情中进行规格选择时是否以`图片`形式显示</div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('input_type')}}</label>
                <div class="layui-input-block">
                    <input type="radio" name="input_type" value="1" title="下拉选择" @if($model->input_type==1)checked @endif>
                    <input type="radio" name="input_type" value="2" title="文本输入" @if($model->input_type==2)checked @endif>
                    <div class="layui-word-aux st-form-tip">创建产品时产品规格的录入方式</div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('select_values')}}</label>
                <div class="layui-input-block">
                    <textarea name="select_values" autocomplete="off" placeholder="多个值回车换行" class="layui-textarea" >{{$model->select_values}}</textarea>
                    <div class="layui-word-aux st-form-tip">当录入方式为 下拉选择 时有效。多个值回车换行</div>
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
