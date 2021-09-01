<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Strongshop</title>
        <meta http-equiv="Pragram" content="no-cache">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <link rel="stylesheet" href="/plugins/layui/css/layui.css">
        <link rel="stylesheet" href="/admin/css/app.css">
        @stack('styles')
        @stack('scripts')
    </head>
    <body>
        <div class="st-body">
            <div class="layui-fluid">
                @yield('content')
            </div>
        </div>
        <script src="/plugins/jquery/jquery-3.5.1.min.js"></script>
        <script src="/plugins/layui/layui.js"></script>
        <script src="/plugins/jquery/jquery-ui-1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript"src="https://cdn.jsdelivr.net/npm/wangeditor@latest/dist/wangEditor.min.js"></script>
        <script src="/admin/js/util.js"></script>
        @stack('scripts_bottom')
    </body>
</html>