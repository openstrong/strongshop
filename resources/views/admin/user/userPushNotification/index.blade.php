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
                <input type="text" name="created_at_begin" id="date" placeholder="???-???-???" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-input-inline">
                <input type="text" name="created_at_end" id="date2" placeholder="???-???-???" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <a class="layui-btn layui-btn-xs st-search-button">????????????</a>
        </div>
    </div>
</form>
<table class="layui-hide" id="ST-TABLE-LIST" lay-filter="ST-TABLE-LIST"></table>
<script type="text/html" id="ST-TOOL-BAR">
    <div class="layui-btn-container st-tool-bar">
        <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/user/userPushNotification/create', this.innerText);">??????</a>
        <a class="layui-btn layui-btn-xs" lay-event="batchDelete" data-href="/admin/user/userPushNotification/destroy">????????????</a>
    </div>
</script>
<script type="text/html" id="ST-OP-BUTTON">
    @verbatim
    <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/user/userPushNotification/update?id={{d.id}}', this.innerText);">??????</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" onclick="Util.destroy('/admin/user/userPushNotification/destroy?id={{d.id}}');">??????</a>
    @endverbatim
</script>
@endsection
@push('scripts_bottom')        
<script>
!function () {
    //??????
    layui.laydate.render({
        elem: '#date'
    });
    layui.laydate.render({
        elem: '#date2'
    });
    //????????????
    var cols = [
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'id', width: 60, fixed: 'left', unresize: true, totalRowText: '??????', sort: true}
                , {field: 'type', title: '{{$model->getAttributeLabel("type")}}', width: 150, sort: true, templet: function (res) {
                    return  res.type==1  ? '<span class="layui-badge layui-bg-cyan">??????</span>' : '<span class="layui-badge layui-bg-cyan">??????</span>';
                    }}
                , {field: 'title', title: '{{$model->getAttributeLabel("title")}}', width: 250, sort: true}
                , {field: 'send_at', title: '{{$model->getAttributeLabel("send_at")}}', width: 150, sort: true}
                , {field: 'status', title: '{{$model->getAttributeLabel("status")}}', width: 150, sort: true, templet: function (res) {
                    return  res.status==1  ? '<span class="layui-badge layui-bg-green">????????????</span>' : '<span class="layui-badge">???????????????</span>';
                    }}
                , {field: 'created_at', title: '{{$model->getAttributeLabel("created_at")}}', width: 150, sort: true}
                , {field: 'updated_at', title: '{{$model->getAttributeLabel("updated_at")}}', width: 150, sort: true}
                , {field: 'remark', title: '{{$model->getAttributeLabel("remark")}}', width: 250, sort: true}
                , {field: 'admin_id', title: '{{$model->getAttributeLabel("admin_id")}}', width: 150, sort: true, templet: function (res) {
                    return  res.admin_user.name;
                    }}
                , {fixed: 'right', title: '??????', toolbar: '#ST-OP-BUTTON', width: 150}
            ];
    var tableConfig = {
        cols: [cols]
    };
    Util.renderTable(tableConfig);
}();
</script>
@endpush