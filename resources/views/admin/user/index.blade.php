@extends('admin.layouts.app')
@push('styles')
<style>
        td div.layui-table-cell{
        height:60px !important;
        line-height: normal !important;
        overflow: inherit;
        white-space: normal;
        overflow: hidden;
    }
</style>
@endpush
@push('scripts')
<script></script>
@endpush
@section('content')
<div class="st-h15"></div>
<form class="layui-form st-form-search" lay-filter="ST-FORM-SEARCH">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('country_code')}}</label>
            <div class="layui-input-inline">
                <select name="country_code">
                    <option value="">--</option>
                    @foreach($countries as $country_code=>$country_name)
                    <option value="{{$country_code}}">{{$country_name}}</option>
                    @endforeach
                </select>   
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('first_name')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="first_name" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('last_name')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="last_name" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
<!--         <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('nickname')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="nickname" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
         <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('email')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="email" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> 
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('mobile')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="mobile" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('status')}}</label>
            <div class="layui-input-inline">
                <select name="status">
                    <option value="">--</option>
                    <option value="1">正常</option>
                    <option value="2">禁用</option>
                </select>   
            </div>
        </div> 
        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('gender')}}</label>
            <div class="layui-input-inline">
                <select name="gender">
                    <option value="">--</option>
                    <option value="0">保密</option>
                    <option value="1">男</option>
                    <option value="2">女</option>
                </select>   
            </div>
        </div> 
         <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('rank_credits')}}</label>
            <div class="layui-input-inline">
                <input type="number" min="0" name="rank_credits_begin" autocomplete="off" placeholder="" class="layui-input">
            </div>
            <div class="layui-input-inline">
                <input type="number" min="0" name="rank_credits_end" autocomplete="off" placeholder="" class="layui-input">
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
        <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/user/create', this.innerText);">添加</a>
        <a class="layui-btn layui-btn-xs" lay-event="batchDelete" data-href="/admin/user/destroy">删除选中</a>
    </div>
</script>
<script type="text/html" id="ST-OP-BUTTON">
    @verbatim
    <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/user/update?id={{d.id}}', this.innerText);">更新</a>
    <!--<a class="layui-btn layui-btn-danger layui-btn-xs" onclick="Util.destroy('/admin/user/destroy?id={{d.id}}');">删除</a>-->
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
                , {field: 'email', title: '{{$model->getAttributeLabel("email")}}', width: 300, sort: true, templet: function (res) {
                        var html = '';
                        html += res.email + '<br/><br/>';
                        if(res.email_verified_at){
                            html += '<span class="layui-badge layui-bg-green">已验证</span>';
                        }else{
                            html += '<span class="layui-badge layui-bg-orange">未验证</span>';
                        }
                        return html;
                    }}
                , {field: 'first_name', title: '{{$model->getAttributeLabel("first_name")}} / {{$model->getAttributeLabel("last_name")}}', width: 150, templet:function(res){
                        return res.first_name +' '+res.last_name;
                }}
                //, {field: 'last_name', title: '{{$model->getAttributeLabel("last_name")}}', width: 150, sort: true}
                , {field: 'country', title: '{{$model->getAttributeLabel("country_code")}}', width: 150, sort: true}
                , {field: 'source', title: '{{$model->getAttributeLabel("source")}}', width: 150, sort: true, templet:function(res){
                        return res.source +'<hr/>'+res.http_referer;
                }}
                , {field: 'created_at', title: '{{$model->getAttributeLabel("created_at")}}', width: 150, sort: true}
                , {field: 'last_login_at', title: '{{$model->getAttributeLabel("last_login_at")}}', width: 150, sort: true}
                , {field: 'last_login_ip', title: '{{$model->getAttributeLabel("last_login_ip")}}', width: 150, sort: true}
                , {field: 'rank_credits', title: '{{$model->getAttributeLabel("rank_credits")}}', width: 150, sort: true}
                , {field: 'pay_credits', title: '{{$model->getAttributeLabel("pay_credits")}}', width: 150, sort: true}
                , {field: 'avatar', title: '{{$model->getAttributeLabel("avatar")}}', width: 150, sort: true, templet: function (res) {
                        if(res.avatar){
                            return  '<img class="st-img-zoom" src="'+res.avatar+'" />';
                        }
                        return '/';
                    }}
                , {field: 'nickname', title: '{{$model->getAttributeLabel("nickname")}}', width: 150, sort: true}
                , {field: 'user_name', title: '{{$model->getAttributeLabel("user_name")}}', width: 150, sort: true}
                , {field: 'email_verified_at', title: '{{$model->getAttributeLabel("email_verified_at")}}', width: 150, sort: true}
                , {field: 'mobile', title: '{{$model->getAttributeLabel("mobile")}}', width: 150, sort: true}
                , {field: 'mobile_verified_at', title: '{{$model->getAttributeLabel("mobile_verified_at")}}', width: 150, sort: true, templet: function (res) {
                        if(res.mobile_verified_at){
                            return  res.mobile_verified_at;
                        }
                        return '<span class="layui-badge layui-bg-orange">未验证</span>';
                    }}
                , {field: 'gender', title: '{{$model->getAttributeLabel("gender")}}', width: 150, sort: true,templet:function(res){
                    return res.gender == 0 ? '保密' : (res.gender ==1? '男' : '女');
                }}
                , {field: 'birthday', title: '{{$model->getAttributeLabel("birthday")}}', width: 150, sort: true}
                , {field: 'status', title: '{{$model->getAttributeLabel("status")}}', width: 80, templet: function (res) {
                    return  res.status==1  ? '<span class="layui-badge layui-bg-green">正常</span>' : '<span class="layui-badge">禁用</span>';
                    }}
                , {field: 'updated_at', title: '{{$model->getAttributeLabel("updated_at")}}', width: 150, sort: true}
                , {fixed: 'right', title: '操作', toolbar: '#ST-OP-BUTTON', width: 150}
            ];
    var tableConfig = {
        cols: [cols]
        ,limit: 20 //每页条数
    };
    var tableIns = Util.renderTable(tableConfig);
    //工具栏事件
    layui.table.on('toolbar(' + tableIns.config.id + ')', function (obj) {
        var checkStatus = layui.table.checkStatus(obj.config.id);
        switch (obj.event) {
            //批量删除
            case 'batchDelete':
                Util.batchDelete($(this).attr('data-href'), checkStatus.data);
                break;
            //批量导出
            case 'ST-EXPORT-EXCEL':
                var data = layui.form.val(tableIns.config.searchFormId);
                Util.exportFile(tableIns, data);
                break;
        }
        return;
    });
}();
</script>
@endpush