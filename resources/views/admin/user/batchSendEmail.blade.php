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
            <label class="layui-form-label">{{$model->getAttributeLabel('email')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="email" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('status')}}</label>
            <div class="layui-input-inline">
                <select name="status">
                    <option value="">--</option>
                    <option value="1" selected="">正常</option>
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
                <input type="number" min="0" name="rank_credits_begin" autocomplete="off" placeholder="min" class="layui-input">
            </div>
            <div class="layui-input-inline">
                <input type="number" min="0" name="rank_credits_end" autocomplete="off" placeholder="max" class="layui-input">
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
            <label class="layui-form-label">订单为零</label>
            <div class="layui-input-inline">
                <input type="text" name="no_order_at_begin" id="date3" placeholder="年-月-日" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-input-inline">
                <input type="text" name="no_order_at_end" id="date4" placeholder="年-月-日" autocomplete="off" class="layui-input">
            </div>
        </div> 
        <div class="layui-inline">
            <a class="layui-btn layui-btn-xs st-search-button">开始搜索</a>
        </div>
    </div>
</form>
<table class="layui-hide" id="ST-TABLE-LIST" lay-filter="ST-TABLE-LIST"></table>

<div class="st-h15"></div>
<form class="layui-form" id="ST-FORM" action="">
    <div class="layui-row">
        <div class="layui-form-item">
            <label class="layui-form-label">邮件标题</label>
            <div class="layui-input-block">
                <input type="text" name="title" value="" autocomplete="off" placeholder="" class="layui-input" >
                <div class="layui-word-aux st-form-tip"></div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮件内容</label>
            <div class="layui-input-block">
                <textarea  name="content"  autocomplete="off" placeholder="" class="layui-textarea layui-hide" id="LAY_ditor" lay-verify="details"></textarea>
                <div class="layui-word-aux st-form-tip"></div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">发送时间</label>
            <div class="layui-input-block">
                <input type="text" name="sendtime" id="sendtime" placeholder="年-月-日" autocomplete="off" class="layui-input">
                <div class="layui-word-aux st-form-tip"></div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>备注</label>
            <div class="layui-input-block">
                <input type="text" name="remark" autocomplete="off" class="layui-input">
                <div class="layui-word-aux st-form-tip">仅作为发送记录备注，和发送邮件内容无关。</div>
            </div>
        </div>
        <div class="layui-form-item st-form-submit-btn">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="ST-SUBMIT">确认提交 (当前搜索条件下全部会员)</button>
                <a class="layui-btn" href="/admin/user/userPushNotification/index">查看历史记录</a>
            </div>
        </div>
    </div>
</form>
<div class="st-h100"></div>
@endsection
@push('scripts_bottom')        
<script>
    !function () {
        //创建一个编辑器
        var editIndex = layui.layedit.build('LAY_ditor', {
            uploadImage: {url: '/admin/upload/image', type: 'post'},
            tool: ['strong', , 'italic', 'underline', 'del', '|', 'left', 'center', 'right', '|', 'link', 'unlink', '|', 'image']
        });
        //自定义验证规则
        layui.form.verify({
            details: function (value) {
                layui.layedit.sync(editIndex);
            }
        });
        //日期
        layui.laydate.render({
            elem: '#date'
        });
        layui.laydate.render({
            elem: '#date2'
        });
        layui.laydate.render({
            elem: '#date3'
        });
        layui.laydate.render({
            elem: '#date4'
        });
        layui.laydate.render({
            elem: '#sendtime',
            type: 'datetime'
        });
        //表格字段
        var cols = [
            {type: 'checkbox', fixed: 'left'}
            , {field: 'id', title: 'id', width: 60, fixed: 'left', unresize: true, totalRowText: '合计', sort: true}
            , {field: 'email', title: '{{$model->getAttributeLabel("email")}}', width: 300, sort: true, templet: function (res) {
                    var html = '';
                    if (res.email_verified_at) {
                        html += '<span class="layui-badge layui-bg-green">已验证</span>';
                    } else {
                        html += '<span class="layui-badge layui-bg-orange">未验证</span>';
                    }
                    html += ' ' + res.email;
                    return html;
                }}
            , {field: 'country', title: '{{$model->getAttributeLabel("country_code")}}', width: 150, sort: true}
            , {field: 'first_name', title: '{{$model->getAttributeLabel("first_name")}}', width: 150, sort: true}
            , {field: 'last_name', title: '{{$model->getAttributeLabel("last_name")}}', width: 150, sort: true}
            , {field: 'created_at', title: '{{$model->getAttributeLabel("created_at")}}', width: 150, sort: true}
            , {field: 'updated_at', title: '{{$model->getAttributeLabel("updated_at")}}', width: 150, sort: true}
            , {field: 'status', title: '{{$model->getAttributeLabel("status")}}', width: 80, templet: function (res) {
                    return  res.status == 1 ? '<span class="layui-badge layui-bg-green">正常</span>' : '<span class="layui-badge">禁用</span>';
                }}
            , {field: 'pay_credits', title: '{{$model->getAttributeLabel("pay_credits")}}', width: 150, sort: true}
            , {field: 'rank_credits', title: '{{$model->getAttributeLabel("rank_credits")}}', width: 150, sort: true}
            , {field: 'last_login_at', title: '{{$model->getAttributeLabel("last_login_at")}}', width: 150, sort: true}
            , {field: 'last_login_ip', title: '{{$model->getAttributeLabel("last_login_ip")}}', width: 150, sort: true}
            , {field: 'avatar', title: '{{$model->getAttributeLabel("avatar")}}', width: 150, sort: true, templet: function (res) {
                    if (res.avatar) {
                        return  '<img class="st-img-zoom" src="' + res.avatar + '" />';
                    }
                    return '/';
                }}
            , {field: 'nickname', title: '{{$model->getAttributeLabel("nickname")}}', width: 150, sort: true}
            , {field: 'user_name', title: '{{$model->getAttributeLabel("user_name")}}', width: 150, sort: true}
            , {field: 'mobile', title: '{{$model->getAttributeLabel("mobile")}}', width: 150, sort: true}
            , {field: 'mobile_verified_at', title: '{{$model->getAttributeLabel("mobile_verified_at")}}', width: 150, sort: true, templet: function (res) {
                    if (res.mobile_verified_at) {
                        return  res.mobile_verified_at;
                    }
                    return '<span class="layui-badge layui-bg-orange">未验证</span>';
                }}
            , {field: 'gender', title: '{{$model->getAttributeLabel("gender")}}', width: 150, sort: true, templet: function (res) {
                    return res.gender == 0 ? '保密' : (res.gender == 1 ? '男' : '女');
                }}
            , {field: 'birthday', title: '{{$model->getAttributeLabel("birthday")}}', width: 150, sort: true}
            //, {fixed: 'right', title: '操作', toolbar: '#ST-OP-BUTTON', width: 150}
        ];
        var tableConfig = {
            cols: [cols]
            , method: 'post'
            , toolbar: false //工具栏
            , height: 'full-500'//高度最大适应化
        };
        //表格渲染
        Util.renderTable(tableConfig);
        //监听提交
        layui.form.on('submit(ST-SUBMIT)', function (data) {
            var searchData = layui.form.val("ST-FORM-SEARCH");
            searchData.batchSendMail = data.field;
            //提交json数据
            var postDatas = JSON.stringify(searchData);
            Util.postForm('#ST-FORM', postDatas, false, 'application/json;charset=utf-8');
            //layer.alert(JSON.stringify(data.field), {
            //    title: '最终的提交信息'
            //});
            return false;
        });
    }();
</script>
@endpush