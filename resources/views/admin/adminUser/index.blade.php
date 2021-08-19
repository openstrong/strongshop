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
            <label class="layui-form-label">{{$model->getAttributeLabel('user_name')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="user_name" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div><div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('role_id')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="role_id" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('name')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="name" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('email')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="email" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('phone')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="phone" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('status')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="status" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('last_at')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="last_at" autocomplete="off" placeholder="" class="layui-input">
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
        <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/adminUser/create', this.innerText);">添加</a>
        <a class="layui-btn layui-btn-xs" lay-event="batchDelete" data-href="/admin/adminUser/destroy">删除选中</a>
    </div>
</script>
<script type="text/html" id="ST-OP-BUTTON">
    @verbatim
    <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/adminUser/update?id={{d.id}}', this.innerText);">分配角色</a>
    <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/adminUser/update?id={{d.id}}', this.innerText);">更新</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" onclick="Util.destroy('/admin/adminUser/destroy?id={{d.id}}');">删除</a>
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
                , {field: 'user_name', title: '{{$model->getAttributeLabel("user_name")}}', width: 150}
                , {field: 'name', title: '{{$model->getAttributeLabel("name")}}', width: 100}
                , {field: 'role_id', title: '{{$model->getAttributeLabel("role_id")}}', width: 150, templet: function (res) {
                                        return  res.roles.map(function(obj,index){
                                                    return obj.name;
                                                }).join(",");
                    }}
                , {field: 'email', title: '{{$model->getAttributeLabel("email")}}', width: 150}
                , {field: 'phone', title: '{{$model->getAttributeLabel("phone")}}', width: 150}
                , {field: 'introduction', title: '{{$model->getAttributeLabel("introduction")}}', width: 150}
                , {field: 'status', title: '{{$model->getAttributeLabel("status")}}', width: 80, templet: function (res) {
                    return  res.status==1  ? '<button class="layui-btn layui-btn-xs st-btn-bg-succ">开启</button>' : '<button class="layui-btn layui-btn-xs layui-btn-radius layui-btn-danger">禁用</button>';
                    }}
                , {field: 'last_ip', title: '{{$model->getAttributeLabel("last_ip")}}', width: 150}
                , {field: 'last_at', title: '{{$model->getAttributeLabel("last_at")}}', width: 150}
                , {field: 'created_at', title: '{{$model->getAttributeLabel("created_at")}}', width: 150}
                , {field: 'updated_at', title: '{{$model->getAttributeLabel("updated_at")}}', width: 150}
                , {fixed: 'right', title: '操作', toolbar: '#ST-OP-BUTTON', width: 200}
            ];
    var tableConfig = {
        cols: [cols]
    };
    Util.renderTable(tableConfig);
}();
</script>
@endpush