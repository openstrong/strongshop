@extends('admin.layouts.app')
@push('styles')
<style>
    td div.layui-table-cell{
        height:80px !important;
        line-height: normal !important;
        overflow: inherit;
        white-space: normal;
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
            <label class="layui-form-label">{{$model->getAttributeLabel('title')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="title" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> 
         <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('sku')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="sku" autocomplete="off" placeholder="" class="layui-input">
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
        <!--<a class="layui-btn layui-btn-xs" onclick="history.back();">返回到订单列表</a>-->
    </div>
</script>
<script type="text/html" id="ST-OP-BUTTON">
    @verbatim
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
                {field: 'id', title: 'id', width: 60, fixed: 'left', unresize: true, totalRowText: '合计', sort: true}
                , {field: 'title', title: '{{$model->getAttributeLabel("title")}}', width: 260, sort: true}
                , {field: 'sku', title: '{{$model->getAttributeLabel("sku")}}', width: 200, sort: true}
                , {field: 'img_cover', title: '{{$model->getAttributeLabel("img_cover")}}', width: 150, sort: true, templet: function (res) {
                    return  '<img class="st-img-zoom" src="'+res.img_cover+'" />';
                }}
                , {field: 'currency_code', title: '{{$model->getAttributeLabel("currency_code")}}', width: 120, sort: true, templet: function (res) {
                    return res.currency_code + '<hr/>' + 'Rate：' + res.currency_rate
                }}
//                , {field: 'original_price', title: '{{$model->getAttributeLabel("original_price")}}', width: 150, sort: true, templet: function (res) {
//                        var defaultCurrencyBackend = '{{config("strongshop.defaultCurrencyBackend")}}';
//                        var html = res.currency_code + ' ' + res.original_price;
//                        if(defaultCurrencyBackend === res.currency_code){
//                            return html;
//                        }
//                        html += '<hr/>';
//                        html += defaultCurrencyBackend + ' ' + (res.original_price * res.currency_rate).toFixed({{config("strongshop.defaultDedimal")}});
//                        return html;
//                }}
                , {field: 'sale_price', title: '{{$model->getAttributeLabel("sale_price")}}', width: 150, sort: true, templet: function (res) {
                        var defaultCurrencyBackend = '{{config("strongshop.defaultCurrencyBackend")}}';
                        var html = res.currency_code + ' ' + res.sale_price;
                        if(defaultCurrencyBackend === res.currency_code){
                            return html;
                        }
                        html += '<hr/>';
                        html += defaultCurrencyBackend + ' ' + (res.sale_price * res.currency_rate).toFixed({{config("strongshop.defaultDedimal")}});
                        return html;
                }}
                , {field: 'specs', title: '{{$model->getAttributeLabel("specs")}}', width: 180, sort: true, templet: function(res){
                    if(!res.specs){
                        return '';
                    }
                    var html = '';
                    for(x in res.specs){
                        html += res.specs[x].name + '：' + res.specs[x].value;
                        html += '<br/>';
                    }
                    return html;
                }}
                , {field: 'qty', title: '{{$model->getAttributeLabel("qty")}}', width: 95, sort: true}
                , {field: 'created_at', title: '{{$model->getAttributeLabel("created_at")}}', width: 150, sort: true}
                //, {field: 'updated_at', title: '{{$model->getAttributeLabel("updated_at")}}', width: 150, sort: true}
                //, {fixed: 'right', title: '操作', toolbar: '#ST-OP-BUTTON', width: 50}
            ];
    var orderId = {{request('orderId')}};
    var tableConfig = {
        cols: [cols],
        toolbar: false,
        where:{orderId:orderId}
    };
    Util.renderTable(tableConfig);
}();
</script>
@endpush