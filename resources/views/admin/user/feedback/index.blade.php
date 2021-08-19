@extends('admin.layouts.app')
@push('styles')
<style>
    td div.layui-table-cell{
    height:80px !important;
    line-height: normal !important;
    overflow: inherit;
    white-space: normal;
    overflow: hidden;
    word-break: break-word;
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
            <label class="layui-form-label">{{$model->getAttributeLabel('type')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="type" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div><div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('user_id')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="user_id" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('title')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="title" autocomplete="off" placeholder="" class="layui-input">
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
        <a class="layui-btn layui-btn-xs" lay-event="batchDelete" data-href="/admin/user/feedback/destroy">删除选中</a>
    </div>
</script>
<script type="text/html" id="ST-OP-BUTTON">
    @verbatim
    <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/user/feedback/update?id={{d.id}}', this.innerText, ['50%','85%'], false, ['确认回复', '取消']);">回复</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" onclick="Util.destroy('/admin/user/feedback/destroy?id={{d.id}}');">删除</a>
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
                , {field: 'type', title: '{{$model->getAttributeLabel("type")}}', width: 150, sort: true,templet: function(res){
                        if(res.type ==1){
                            return 'Buy';
                        }else if(res.type ==2){
                            return 'Complaint';
                        }else{
                            return 'Other';
                        }
                }}
                , {field: 'user_id', title: '{{$model->getAttributeLabel("user_id")}}', width: 250, sort: true,templet: function(res){
                        return res.user.first_name + '</br>' + res.user.last_name+ '</br>' + res.user.email;
                }}
                , {field: 'title', title: '{{$model->getAttributeLabel("title")}}', width: 400, sort: true}
//                , {field: 'content', title: '{{$model->getAttributeLabel("content")}}', width: 150, sort: true}
//                , {field: 'content_reply', title: '{{$model->getAttributeLabel("content_reply")}}', width: 150, sort: true}
//                , {field: 'admin_id', title: '{{$model->getAttributeLabel("admin_id")}}', width: 150, sort: true,templet: function(res){
//                        return res.admin_user ? res.admin_user.name : '--';
//                }}
                //, {field: 'more', title: '{{$model->getAttributeLabel("more")}}', width: 150, sort: true}
                , {field: 'status', title: '{{$model->getAttributeLabel("status")}}', width: 150, sort: true,templet: function(res){
                        return res.status ==1 ? '<span class="layui-badge">待回复</span>' : '<span class="layui-badge layui-bg-green">已回复</span>';
                }}
                , {field: 'created_at', title: '{{$model->getAttributeLabel("created_at")}}', width: 150, sort: true}
                , {field: 'updated_at', title: '{{$model->getAttributeLabel("updated_at")}}', width: 150, sort: true}
                , {field: 'deleted_at', title: '{{$model->getAttributeLabel("deleted_at")}}', width: 150, sort: true}
                , {fixed: 'right', title: '操作', toolbar: '#ST-OP-BUTTON', width: 150}
            ];
    var tableConfig = {
        cols: [cols],
        initSort:{
            field: 'status' //排序字段，对应 cols 设定的各字段名
            , type: 'asc' //排序方式  asc: 升序、desc: 降序、null: 默认排序
        }
    };
    Util.renderTable(tableConfig);
}();
</script>
@endpush