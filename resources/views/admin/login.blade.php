<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="renderer" content="webkit">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>Strongshop后台管理</title>
        <link rel="stylesheet" href="/plugins/layui/css/layui.css">
        <link rel="stylesheet" href="/admin/css/style.css">
    </head>
    <body>
        <div class="layui-container st-login-box">
            <div class="st-login">
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>{{config('strongshop.storeName')}} 后台管理</legend>
                </fieldset>
                <form class="layui-form layui-form-pane" action="/admin/login" lay-filter="ST-FORM" id="ST-FORM">
                    <div class="layui-form-item">
                        <label class="layui-form-label">登录用户</label>
                        <div class="layui-input-block">
                            <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">登录密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="password" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">验证码</label>
                        <div class="layui-input-inline">
                            <input type="text" name="captcha" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-input-inline">
                            <img class="captcha" src="/admin/captcha" onclick="this.src='/admin/captcha?'+Math.random()" title="点击刷新" />
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <button type="submit" class="layui-btn" lay-submit="" lay-filter="ST-SUBMIT">立即登录</button>
                    </div>
                </form>
            </div>
        </div>
        <script src="/plugins/jquery/jquery-3.5.1.min.js"></script>
        <script src="/plugins/layui/layui.js"></script>
        <script src="/plugins/jquery/jquery-ui-1.12.1/jquery-ui.min.js"></script>
        <script src="/admin/js/util.js"></script>
        <script>
            !function () {
                layui.form.on('submit(ST-SUBMIT)', function (data) {
                    console.log(data)
                    Util.postForm('ST-FORM', data.field, false);
                    return false;
                });
            }();
        </script>
    </body>
</html>