@extends('admin.layouts.app')

@push('styles')
<style>
    /*.layui-form-label{width:150px;}*/
</style>
@endpush

@push('scripts')
<script></script>
@endpush

@section('content')
<div class="st-h15"></div>
<form class="layui-form" action="/admin/webconfig/save/config">
    <button type="button" id="clearcache" class="layui-btn layui-btn-sm">清楚缓存</button>
    <div class="layui-tab layui-tab-brief">
        <ul class="layui-tab-title">
            <li class="layui-this">基本配置</li>
            <li>邮件配置</li>
            <li>产品配置</li>
            <li>订单配置</li>
        </ul>
        <div class="layui-tab-content">
            <!--基本设置-->
            <div class="layui-tab-item layui-show">
                <div class="layui-form-item">
                    <label class="layui-form-label st-form-input-required">商店标题</label>
                    <div class="layui-input-block">
                        <input type="text" name="store_title" value="{{$data['store_title'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                        <div class="layui-word-aux st-form-tip"></div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label st-form-input-required">商店关键字</label>
                    <div class="layui-input-block">
                        <input type="text" name="meta_keywords" value="{{$data['meta_keywords'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                        <div class="layui-word-aux st-form-tip"></div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label st-form-input-required">商店描述</label>
                    <div class="layui-input-block">
                        <input type="text" name="meta_description" value="{{$data['meta_description'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                        <div class="layui-word-aux st-form-tip"></div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label st-form-input-required"><i class="layui-icon layui-icon-help st-form-tip-help"></i>网站通知</label>
                    <div class="layui-input-block">
                        <input type="text" name="notice" value="{{$data['notice'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                        <div class="layui-word-aux st-form-tip">显示在网站顶部的全局通知</div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>会员注册</label>
                    <div class="layui-input-block">
                        <input name="notice_email_signed" lay-text="发送邮件|不发送邮件" @if(isset($data['notice_email_signed']) && $data['notice_email_signed'])) checked="" @endif type="checkbox" lay-skin="switch" >
                        <div class="layui-word-aux st-form-tip">会员注册成功后是否发送邮件通知</div>
                    </div>
                </div>
            </div>
            <!--邮件-->
            <div class="layui-tab-item">
                <div class="layui-row">
                    <div class="layui-col-xs6">
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required">发件服务器</label>
                            <div class="layui-input-block">
                                <input type="text" name="MAIL_HOST" value="{{$data['MAIL_HOST'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip layui-show">发送邮件服务器，示例：smtp.qq.com</div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required">加密协议</label>
                            <div class="layui-input-block">
                                <select name="MAIL_ENCRYPTION">
                                    <option value="">-无-</option>
                                    <option value="ssl" @if(isset($data['MAIL_ENCRYPTION']) && $data['MAIL_ENCRYPTION']=='ssl') selected @endif>SSL</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required">端口</label>
                            <div class="layui-input-block">
                                <input type="text" name="MAIL_PORT" value="{{$data['MAIL_PORT'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip layui-show">发送邮件服务器端口，ssl 加密端口：465；普通端口：25</div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required">邮箱账号</label>
                            <div class="layui-input-block">
                                <input type="text" name="MAIL_USERNAME" value="{{$data['MAIL_USERNAME'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required">邮箱密码</label>
                            <div class="layui-input-block">
                                <input type="password" name="MAIL_PASSWORD" value="" autocomplete="off" placeholder="" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required">回复地址</label>
                            <div class="layui-input-block">
                                <input type="text" name="MAIL_REPLYTO_ADDRESS" value="{{$data['MAIL_REPLYTO_ADDRESS'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required">回复名称</label>
                            <div class="layui-input-block">
                                <input type="text" name="MAIL_REPLYTO_NAME" value="{{$data['MAIL_REPLYTO_NAME'] ?? ''}}" autocomplete="off" placeholder="" class="layui-input">
                            </div>
                        </div>
                        <hr/>
                        <div class="layui-form-item">
                            <label class="layui-form-label"></label>
                            <div class="layui-input-inline">
                                <input id="receiveMailTest" type="text" value="" autocomplete="off" placeholder="收信邮箱地址" class="layui-input">
                            </div>
                            <div class="layui-input-inline">
                                <button type="button" class="layui-btn" id="sendReceiveMailTest">发送测试邮件</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--产品配置-->
            <div class="layui-tab-item">
            </div>
            <!--订单配置-->
            <div class="layui-tab-item">
                <div class="layui-form-item">
                    <label class="layui-form-label">下单成功</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="notice_email_created_order" lay-skin="switch" lay-text="发送邮件|不发送邮件" @if(isset($data['notice_email_created_order']) && $data['notice_email_created_order'])) checked="" @endif>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">支付成功</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="notice_email_paid_order" lay-skin="switch" lay-text="发送邮件|不发送邮件" @if(isset($data['notice_email_paid_order']) && $data['notice_email_paid_order'])) checked="" @endif>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">发货成功</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="notice_email_shipped_order" lay-skin="switch" lay-text="发送邮件|不发送邮件" @if(isset($data['notice_email_shipped_order']) && $data['notice_email_shipped_order'])) checked="" @endif>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">订单关闭</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="notice_email_closed_order" lay-skin="switch" lay-text="发送邮件|不发送邮件" @if(isset($data['notice_email_closed_order']) && $data['notice_email_closed_order'])) checked="" @endif>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-form-item st-form-submit-btn">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="ST-SUBMIT">保存</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
@endsection

@push('scripts_bottom')
<script>
    !function () {
        //监听提交
        layui.form.on('submit(ST-SUBMIT)', function (data) {
            //console.log(data)
            Util.postForm('form.layui-form', data.field, false);
            //layer.alert(JSON.stringify(data.field), {
            //    title: '最终的提交信息'
            //});
            return false;
        });
        //清缓存
        $("#clearcache").click(function () {
            $.post('/admin/webconfig/clearcache', function (res) {
                if (res.code === 200) {
                    layer.msg(res.message, {
                        time: 1500
                    });
                }
            });
        });
        //测试邮件
        $("#sendReceiveMailTest").click(function () {
            var addr = $("#receiveMailTest").val();
            $.post('/admin/webconfig/sendReceiveMailTest', {
                addr: addr
                , MAIL_HOST: $("input[name=MAIL_HOST]").val()
                , MAIL_ENCRYPTION: $("select[name=MAIL_ENCRYPTION]").val()
                , MAIL_PORT: $("input[name=MAIL_PORT]").val()
                , MAIL_USERNAME: $("input[name=MAIL_USERNAME]").val()
                , MAIL_PASSWORD: $("input[name=MAIL_PASSWORD]").val()
                , MAIL_REPLYTO_ADDRESS: $("input[name=MAIL_REPLYTO_ADDRESS]").val()
                , MAIL_REPLYTO_NAME: $("input[name=MAIL_REPLYTO_NAME]").val()
            }, function (res) {
                if (res.code === 200) {
                    layer.msg(res.message, {
                        time: 1500
                    });
                } else {
                    layer.alert(res.message);
                }
            });
        });
    }();
</script>
@endpush
