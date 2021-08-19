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
    <!--基本信息-->
    <div class="layui-tab-item layui-show">
        <div class="layui-row">
            <div class="layui-col-xs11">
                <div class="layui-form-item">
                    <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('order_no')}}</label>
                    <div class="layui-input-block">
                        <input type="text" name="order_no" value="{{$model->order_no}}" autocomplete="off" placeholder="" class="layui-input" readonly="">
                        <div class="layui-word-aux st-form-tip"></div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">{{$model->getAttributeLabel('tracking_no')}}</label>
                    <div class="layui-input-inline">
                        <input type="text" name="tracking_no" value="{{$model->tracking_no}}" autocomplete="off" placeholder="{{$model->getAttributeLabel('tracking_no')}}" class="layui-input">
                        <div class="layui-word-aux st-form-tip"></div>
                    </div>
                    <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('shipping_remark')}}</label>
                    <div class="layui-input-inline">
                        <input type="text" name="shipping_remark" value="{{$model->shipping_remark}}" autocomplete="off" placeholder="" class="layui-input">
                        <div class="layui-word-aux st-form-tip">可填写具体配送公司等信息，此信息在前台订单详情显示</div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('remark')}}</label>
                    <div class="layui-input-block">
                        <textarea  name="remark" autocomplete="off" placeholder="" class="layui-textarea"  readonly="">{{$model->remark}}</textarea>
                        <div class="layui-word-aux st-form-tip"></div>
                    </div>
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
