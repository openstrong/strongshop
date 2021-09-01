@extends('admin.layouts.app')
@push('styles')
<style>
    td div.layui-table-cell{
    height:60px !important;
    line-height: normal !important;
    overflow: inherit;
    white-space: normal;
}
</style>
@endpush
@push('scripts')
<script></script>
@endpush
@section('content')
<div class="st-h15"></div>
<form class="layui-form st-form-search" lay-filter="ST-FORM-SEARCH">
    <div class="layui-form-item"><div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('title')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="title" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('status')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="status" autocomplete="off" placeholder="" class="layui-input">
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
        <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/product/brand/create', this.innerText);">添加</a>
        <a class="layui-btn layui-btn-xs" lay-event="batchDelete" data-href="/admin/product/brand/destroy">删除选中</a>
    </div>
</script>
<script type="text/html" id="ST-OP-BUTTON">
    @verbatim
    <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/product/brand/update?id={{d.id}}', this.innerText);">更新</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" onclick="Util.destroy('/admin/product/brand/destroy?id={{d.id}}');">删除</a>
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
                , {field: 'title', title: '{{$model->getAttributeLabel("title")}}', width: 150, sort: true}
                , {field: 'logo', title: '{{$model->getAttributeLabel("logo")}}', width: 150, templet: function (res) {
                    return  '<img class="st-img-zoom" src="'+res.logo+'" />';
                    }}
                , {field: 'status', title: '{{$model->getAttributeLabel("status")}}', width: 80, sort: true, templet: function (res) {
                    return  res.status==1  ? '<span class="layui-badge layui-bg-green">启用</span>' : '<span class="layui-badge">禁用</span>';
                    }}
                , {field: 'sort', title: '{{$model->getAttributeLabel("sort")}}', width: 150, sort: true}
                , {field: 'created_at', title: '{{$model->getAttributeLabel("created_at")}}', width: 150, sort: true}
                , {field: 'updated_at', title: '{{$model->getAttributeLabel("updated_at")}}', width: 150, sort: true}
                , {fixed: 'right', title: '操作', toolbar: '#ST-OP-BUTTON', width: 150}
            ];
    var tableConfig = {
        cols: [cols]
    };
    Util.renderTable(tableConfig);
}();
</script>
@endpush