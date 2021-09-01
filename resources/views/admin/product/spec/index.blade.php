@extends('admin.layouts.app')
@push('styles')
<style></style>
@endpush
@push('scripts')
<script></script>
@endpush
@section('content')
<div class="st-h15"></div>
<form class="layui-form st-form-search" lay-filter="ST-FORM-SEARCH">
    <div class="layui-form-item"><div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('spec_group_id')}}</label>
            <div class="layui-input-inline">
                <select name="spec_group_id">
                    <option value="">请选择</option>
                    @foreach ($specGroups as $specGroup)
                    <option value="{{$specGroup->id}}" @if(request('spec_group_id') == $specGroup->id)selected @endif>{{$specGroup->name}}</option>
                    @endforeach
                </select>   
            </div>
        </div><div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('name')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="name" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('spec_type')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="spec_type" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('input_type')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="input_type" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('select_values')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="select_values" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('created_at')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="created_at" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('updated_at')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="updated_at" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('created_at')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="created_at_begin" id="date" placeholder="年-月-日" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-input-inline">
                <input type="text" name="created_at_end" id="date2" placeholder="年-月-日" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <a class="layui-btn layui-btn-xs st-search-button">开始搜索</a>
        </div>
    </div>
</form>
<table class="layui-hide" id="ST-TABLE-LIST" lay-filter="ST-TABLE-LIST"></table>
<script type="text/html" id="ST-TOOL-BAR">
    <div class="layui-btn-container st-tool-bar">
        <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/product/spec/create', this.innerText);">添加规格</a>
        <a class="layui-btn layui-btn-xs" lay-event="batchDelete" data-href="/admin/product/spec/destroy">删除选中</a>
        <a class="layui-btn layui-btn-xs" href="/admin/product/specGroup/index">规格分组</a>
    </div>
</script>
<script type="text/html" id="ST-OP-BUTTON">
    @verbatim
    <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/product/spec/update?id={{d.id}}', this.innerText);">更新</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" onclick="Util.destroy('/admin/product/spec/destroy?id={{d.id}}');">删除</a>
    @endverbatim
</script>
@endsection
@push('scripts_bottom')        
<script>
!function () {
    //日期
    layui.laydate.render({
        elem: '#date'
    });
    layui.laydate.render({
        elem: '#date2'
    });
    //表格字段
    var cols = [
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'id', width: 60, fixed: 'left', unresize: true, totalRowText: '合计', sort: true}
                , {field: 'spec_group_id', title: '{{$model->getAttributeLabel("spec_group_id")}}', width: 150, sort: true,templet: function (res) {
                    return  res.spec_group.name;
                    }}
                , {field: 'name', title: '{{$model->getAttributeLabel("name")}}', width: 150, sort: true}
                , {field: 'spec_type', title: '{{$model->getAttributeLabel("spec_type")}}', width: 150, sort: true,templet: function (res) {
                    return  res.spec_type == 1 ? '价格规格' : '普通规格';
                    }}
                , {field: 'input_type', title: '{{$model->getAttributeLabel("input_type")}}', width: 150, sort: true,templet: function (res) {
                    return  res.spec_type == 1 ? '下拉选择' : '文本输入';
                    }}
                , {field: 'select_values', title: '{{$model->getAttributeLabel("select_values")}}', width: 350, sort: true}
                , {field: 'created_at', title: '{{$model->getAttributeLabel("created_at")}}', width: 150, sort: true}
                , {field: 'updated_at', title: '{{$model->getAttributeLabel("updated_at")}}', width: 150, sort: true}
                , {fixed: 'right', title: '操作', toolbar: '#ST-OP-BUTTON', width: 150}
            ];
    //查询条件
    var spec_group_id = '{!!request('spec_group_id')!!}';
    var tableConfig = {
        cols: [cols]
        ,where:{spec_group_id:spec_group_id}
    };
    Util.renderTable(tableConfig);
}();
</script>
@endpush