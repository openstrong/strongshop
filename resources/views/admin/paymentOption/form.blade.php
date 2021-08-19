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
                <label class="layui-form-label">{{$model->getAttributeLabel('desc')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="desc" value="{{$model->desc}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('code')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="code" value="{{$model->code}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('status')}}</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="1" title="启用" @if($model->status==1)checked @endif>
                    <input type="radio" name="status" value="2" title="禁用" @if($model->status==2)checked @endif>
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">收款账号</label>
                <div class="layui-input-block">
                    <input type="text" name="more[business]" value="{{$model->more['business'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip layui-show"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>手续费</label>
                <div class="layui-input-block">
                    <input type="text" name="more[rate]" value="{{$model->more['rate'] ?? ''}}" autocomplete="off" placeholder="5% 按比例收取； 20 按金额收取" class="layui-input">
                    <div class="layui-word-aux st-form-tip layui-show">例1：5%，按比例收取； 例2：20，按金额收取</div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>结算货币</label>
                <div class="layui-input-block">
                    <input type="text" name="more[currency]" value="{{$model->more['currency'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip layui-show">结算货币，不设置则自动识别</div>
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
