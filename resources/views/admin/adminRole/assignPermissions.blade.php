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
    <input type="hidden" name="id" value="{{$model->id}}">
    <div id="ST-TREE"></div>
    <div class="layui-form-item st-form-submit-btn">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="ST-SUBMIT">立即提交</button>
        </div>
    </div>
</form>
@endsection

@push('scripts_bottom')
<script>
    !function () {
        //模拟数据
        var data = {!!$menus!!}
        ;
        //基本演示
        layui.tree.render({
            elem: '#ST-TREE'
            , data: data
            , showCheckbox: true  //是否显示复选框
            , id: 'ST-TREE'
                    //, isJump: true //是否允许点击节点时弹出新窗口跳转
            , click: function (obj) {
                //var data = obj.data;  //获取当前点击的节点数据
                //layer.msg('状态：' + obj.state + '<br>节点数据：' + JSON.stringify(data));
            }
        });
        //监听提交
        layui.form.on('submit(ST-SUBMIT)', function (data) {
            var checkedData = layui.tree.getChecked('ST-TREE'); //获取选中节点的数据
            data.field.checkedData = checkedData;
            Util.postForm('#ST-FORM', data.field, false);
            return false;
        });
    }();
</script>
@endpush
