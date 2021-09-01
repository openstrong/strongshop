<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="renderer" content="webkit">
        <title>{{config('app.name')}} 管理后台</title>
        <link rel="stylesheet" href="/plugins/layui/css/layui.css">
        <link rel="stylesheet" href="/admin/css/app.css">
        <style>
            .layui-layout-admin .layui-logo{
                overflow: hidden;
            }
        </style>
    </head>
    <body class="layui-layout-body">
        <div class="layui-layout layui-layout-admin">
            <div class="layui-header">
                <div class="layui-logo" title="{{config('strongshop.storeName')}} 后台管理">{{config('strongshop.storeName')}} 后台管理</div>
                <!-- 头部区域（可配合layui已有的水平导航） -->
                <ul class="layui-nav layui-layout-left">
                    <li class="layui-nav-item"><a href="/admin/index/panel" target="mainBody">面板</a></li>
                    <li class="layui-nav-item"><a href="/admin/order/index" target="mainBody">订单管理</a></li>
                    <li class="layui-nav-item"><a href="/admin/user/index" target="mainBody">用户管理</a></li>
                    <li class="layui-nav-item"><a href="/admin/user/feedback/index" target="mainBody">意见反馈</a></li>
                    <!--                                        <li class="layui-nav-item">
                                                                <a href="javascript:;">其它系统</a>
                                                                <dl class="layui-nav-child">
                                                                    <dd><a href="">邮件管理</a></dd>
                                                                    <dd><a href="">消息管理</a></dd>
                                                                    <dd><a href="">授权管理</a></dd>
                                                                </dl>
                                                            </li>-->
                </ul>
                <ul class="layui-nav layui-layout-right">
                    <li class="layui-nav-item"><a href="/" target="_blank">网站首页</a></li>
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon layui-icon-username" style="font-size:20px;"></i>
                            {{auth('admin')->user()->name ?: auth('admin')->user()->user_name}}
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="/admin/logout">退出</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>

            <div class="layui-side layui-bg-black st-leftmenu">
                <div class="layui-side-scroll">
                    <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                    <ul class="layui-nav layui-nav-tree" style="min-height: 1000px;">
                        @foreach($rows as $row)
                        <!--默认展开菜单 请追加样式 “layui-nav-itemed”-->
                        <li class="layui-nav-item">
                            <a href="javascript:;">{{$row->name}}</a>
                            <dl class="layui-nav-child">
                                @foreach($row->children as $child)
                                <dd @if($default_url==$child->route_url)class="layui-this" @endif >
                                    @if(preg_match('/^https?:/i',$child->route_url))
                                    <a href="{{$child->route_url}}" target="mainBody">{{$child->name}}</a>
                                    @else
                                    <a href="/{{$child->route_url}}" target="mainBody">{{$child->name}}</a>
                                    @endif
                                </dd>
                                @endforeach
                            </dl>
                        </li>
                        @endforeach
                    </ul>
                    <p style="height: 10px;"></p>
                    <p style="font-size:12px; color:#999;text-align: center;">{!!$_copy!!}</p>
                    <p style="height: 10px;"></p>
                </div>
            </div>

            <div class="layui-body st-iframe-body">
                <!-- 内容主体区域 -->
                <iframe src="/{{$default_url}}" name="mainBody" frameborder="0" scrolling="yes"></iframe>
            </div>

            <!-- 底部固定区域 -->
            <!--            <div class="layui-footer st-footer">
                            底部固定区域
                        </div>-->
        </div>
        <script src="/plugins/jquery/jquery-3.5.1.min.js"></script>
        <script src="/plugins/layui/layui.js"></script>
        <script>
$(".layui-nav-tree li dl dd a").click(function () {
    $("ul.layui-nav li").removeClass('layui-this');
});
        </script>
    </body>
</html>