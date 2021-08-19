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
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('name')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="name" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
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
        <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/adminRole/create', this.innerText);">添加</a>
        <a class="layui-btn layui-btn-xs" lay-event="batchDelete" data-href="/admin/adminRole/destroy">删除选中</a>
    </div>
</script>
<script type="text/html" id="ST-OP-BUTTON">
    @verbatim
    <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/adminRole/assignPermissions?id={{d.id}}', this.innerText);">分配权限</a>
    <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/adminRole/update?id={{d.id}}', this.innerText);">更新</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" onclick="Util.destroy('/admin/adminRole/destroy?id={{d.id}}');">删除</a>
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
    var cols = [
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'id', width: 80, fixed: 'left', unresize: true, totalRowText: '合计', sort: true}
                , {field: 'name', title: '{{$model->getAttributeLabel("name")}}'}
                , {field: 'desc', title: '{{$model->getAttributeLabel("desc")}}'}
                , {field: 'created_at', title: '{{$model->getAttributeLabel("created_at")}}'}
                , {field: 'updated_at', title: '{{$model->getAttributeLabel("updated_at")}}'}
                , {fixed: 'right', title: '操作', toolbar: '#ST-OP-BUTTON', width: 250}
            ];
    var tableConfig = {
        elem: '#ST-TABLE-LIST'//table 容器唯一 id
        ,searchFormId: 'ST-FORM-SEARCH'//查询搜索表单id(自定义字段值)
        ,url: window.location.pathname
        ,cols: [cols]
    };
    Util.renderTable(tableConfig);
}();
</script>
@endpush