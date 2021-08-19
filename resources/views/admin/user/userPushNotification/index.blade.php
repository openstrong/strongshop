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
<!--        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('type')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="type" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>-->
        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('title')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="title" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('admin_id')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="admin_id" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('send_at')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="send_at" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
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
        <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/user/userPushNotification/create', this.innerText);">添加</a>
        <a class="layui-btn layui-btn-xs" lay-event="batchDelete" data-href="/admin/user/userPushNotification/destroy">删除选中</a>
    </div>
</script>
<script type="text/html" id="ST-OP-BUTTON">
    @verbatim
    <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/user/userPushNotification/update?id={{d.id}}', this.innerText);">更新</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" onclick="Util.destroy('/admin/user/userPushNotification/destroy?id={{d.id}}');">删除</a>
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
                , {field: 'type', title: '{{$model->getAttributeLabel("type")}}', width: 150, sort: true, templet: function (res) {
                    return  res.type==1  ? '<span class="layui-badge layui-bg-cyan">邮件</span>' : '<span class="layui-badge layui-bg-cyan">短信</span>';
                    }}
                , {field: 'title', title: '{{$model->getAttributeLabel("title")}}', width: 250, sort: true}
                , {field: 'send_at', title: '{{$model->getAttributeLabel("send_at")}}', width: 150, sort: true}
                , {field: 'status', title: '{{$model->getAttributeLabel("status")}}', width: 150, sort: true, templet: function (res) {
                    return  res.status==1  ? '<span class="layui-badge layui-bg-green">正常发送</span>' : '<span class="layui-badge">已取消发送</span>';
                    }}
                , {field: 'created_at', title: '{{$model->getAttributeLabel("created_at")}}', width: 150, sort: true}
                , {field: 'updated_at', title: '{{$model->getAttributeLabel("updated_at")}}', width: 150, sort: true}
                , {field: 'remark', title: '{{$model->getAttributeLabel("remark")}}', width: 250, sort: true}
                , {field: 'admin_id', title: '{{$model->getAttributeLabel("admin_id")}}', width: 150, sort: true, templet: function (res) {
                    return  res.admin_user.name;
                    }}
                , {fixed: 'right', title: '操作', toolbar: '#ST-OP-BUTTON', width: 150}
            ];
    var tableConfig = {
        cols: [cols]
    };
    Util.renderTable(tableConfig);
}();
</script>
@endpush