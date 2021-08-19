@extends('admin.layouts.app')
@push('styles')
<style>
    td div.layui-table-cell{
        height:86px !important;
        /*line-height: normal !important;*/
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
    <div class="layui-form-item"><div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('user_id')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="user_id" autocomplete="off" placeholder="email" class="layui-input">
            </div>
        </div><div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('order_no')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="order_no" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('order_status')}}</label>
            <div class="layui-input-inline">
                <select name="order_status">
                    <option value="">--</option>
                    @foreach($order_status as $status_key=>$status_val)
                    <option value="{{$status_key}}" @if(request('order_status')==$status_key) selected="" @endif >{{$status_val['name']}}</option>
                    @endforeach
                </select>  
            </div>
        </div> 
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('shipping_option_id')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="shipping_option_id" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('payment_option_id')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="payment_option_id" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('transaction_id')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="transaction_id" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('remark')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="remark" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('first_name')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="first_name" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('last_name')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="last_name" autocomplete="off" placeholder="" class="layui-input">
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
        <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/order/create', this.innerText);">添加</a>
        <a class="layui-btn layui-btn-xs" lay-event="batchDelete" data-href="/admin/order/destroy">删除选中</a>
        <a class="layui-btn layui-btn-xs" lay-event="batchPrint" data-href="/admin/order/print">批量打印</a>
    </div>
</script>
<script type="text/html" id="ST-OP-BUTTON">
    @verbatim
    <a class="layui-btn layui-btn-xs" onclick="Util.createWindow('/admin/order/show?id={{d.id}}', this.innerText);">查看</a>
    <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/order/update?id={{d.id}}', this.innerText, ['65%', '75%']);">更新</a>
    <hr />
    <a class="layui-btn layui-btn-xs" href="/admin/order/print?id={{d.id}}" target="_blank">打印</a>
    <a class="layui-btn layui-btn-xs" lay-event="more">更多 <i class="layui-icon layui-icon-down"></i></a>
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
                , {field: 'order_no', title: '{{$model->getAttributeLabel("order_no")}}', width: 180, fixed: 'left', sort: true, templet: function (res) {
                        var html = res.order_no + '<br/><br/>';
                        html += '<span class="layui-badge '+res.order_status_style+'">'+res.order_status_label+'</span>'
                        return html;
                }}
                , {field: 'created_at', title: '{{$model->getAttributeLabel("created_at")}}', width: 210,fixed: 'left', sort: true, templet: function (res) {
                        var html = res.buyer.email;
                        html += '<br/><br/>' + res.created_at;
                        return  html;
                }}
                , {field: 'country', title: '收货信息', width: 310, templet: function (res) {
                        var html = '';
                        html += res.first_name + ' ' + res.last_name;
                        html += ' [' + res.country + ']';
                        html += '<hr/>';
                        html += res.address_line_1;
                        return  html;
                }}
                , {field: 'weight_total', title: '{{$model->getAttributeLabel("weight_total")}}', width: 100, sort: true, templet: function (res) {
                    return (res.weight_total/1000) + '千克';
                }}
                , {field: 'currency_code', title: '{{$model->getAttributeLabel("currency_code")}}', width: 120, sort: true, templet: function (res) {
                    return res.currency_code + '<hr/>' + 'Rate：' + res.currency_rate;
                }}
                , {field: 'order_amount', title: '{{$model->getAttributeLabel("order_amount")}}', width: 120, sort: true, templet: function (res) {
                        var defaultCurrencyBackend = '{{config("strongshop.defaultCurrencyBackend")}}';
                        var html = res.currency_code + ' ' + res.order_amount;
                        if(defaultCurrencyBackend === res.currency_code){
                            return html;
                        }
                        html += '<hr/>';
                        html += defaultCurrencyBackend + ' ' + (res.order_amount / res.currency_rate).toFixed({{config("strongshop.defaultDedimal")}});
                        return html;
                }}
                , {field: 'paid_amount', title: '{{$model->getAttributeLabel("paid_amount")}}', width: 120, sort: true, templet: function (res) {
                        var defaultCurrencyBackend = '{{config("strongshop.defaultCurrencyBackend")}}';
                        var html = res.currency_code + ' ' + res.paid_amount;
                        if(defaultCurrencyBackend === res.currency_code){
                            return html;
                        }
                        html += '<hr/>';
                        html += defaultCurrencyBackend + ' ' + (res.paid_amount / res.currency_rate).toFixed({{config("strongshop.defaultDedimal")}});
                        return html;
                }}
                , {field: 'products_amount', title: '{{$model->getAttributeLabel("products_amount")}}', width: 120, sort: true, templet: function (res) {
                        var defaultCurrencyBackend = '{{config("strongshop.defaultCurrencyBackend")}}';
                        var html = res.currency_code + ' ' + res.products_amount;
                        if(defaultCurrencyBackend === res.currency_code){
                            return html;
                        }
                        html += '<hr/>';
                        html += defaultCurrencyBackend + ' ' + (res.products_amount / res.currency_rate).toFixed({{config("strongshop.defaultDedimal")}});
                        return html;
                }}
                , {field: 'source', title: '{{$model->getAttributeLabel("source")}}', width: 150, sort: true, templet:function(res){
                        var html = '';
                        if(res.source){
                            html += res.source;
                        }
                        if(res.http_referer){
                            html += '<hr/>'+res.http_referer;
                        }
                        return html;
                }}
                , {field: 'pay_remark', title: '{{$model->getAttributeLabel("pay_remark")}}', width: 150, sort: true}
                , {field: 'shipping_option_id', title: '{{$model->getAttributeLabel("shipping_option_id")}}', width: 150, sort: true, templet: function (res) {
                        return res.shipping_option.title +'<br/>' + '跟踪单号：' + res.tracking_no;
                }}
                , {field: 'payment_option_id', title: '{{$model->getAttributeLabel("payment_option_id")}}', width: 150, sort: true, templet: function (res) {
                        return res.payment_option.title + '<br/>' + '交易单号：' + res.transaction_id;
                }}
                , {field: 'remark', title: '{{$model->getAttributeLabel("remark")}}', width: 150, sort: true}
                , {field: 'shipped_at', title: '{{$model->getAttributeLabel("shipped_at")}}', width: 150, sort: true}
                , {field: 'received_at', title: '{{$model->getAttributeLabel("received_at")}}', width: 150, sort: true}
                , {field: 'canceled_at', title: '{{$model->getAttributeLabel("canceled_at")}}', width: 150, sort: true}
                , {field: 'returned_at', title: '{{$model->getAttributeLabel("returned_at")}}', width: 150, sort: true}
                , {fixed: 'right', title: '操作', toolbar: '#ST-OP-BUTTON', width: 150}
            ];
    var order_status = "{{request('order_status')}}";
    var tableConfig = {
        cols: [cols]
        ,where:{order_status:order_status}
    };
    var tableIns = Util.renderTable(tableConfig);
    
    var tableId = tableIns.config.id;
    //工具栏事件
    layui.table.on('toolbar(' + tableId + ')', function (obj) {
        var checkStatus = layui.table.checkStatus(obj.config.id);
        switch (obj.event) {
            case 'batchDelete':
                Util.batchDelete($(this).attr('data-href'), checkStatus.data);
                break;
            case 'ST-EXPORT-EXCEL':
                var data = layui.form.val(Util.tableConfigDefault.searchFormId);
                Util.exportFile(tableIns, data);
                break;
            case 'batchPrint':
                var arr = $.map(checkStatus.data, function (n, i) {
                    return n['id'];
                });
                var idStr = arr.join('|');
                window.open('/admin/order/print?id='+idStr);
                break;
        }
        return;
    });
    
    //行工具事件
  layui.table.on('tool(ST-TABLE-LIST)', function(obj){
    var that = this,d = obj.data;
    console.log(d)
    if(obj.event === 'more'){
        //更多下拉菜单
        var dataOp = [];
        if(d.order_status === 10){
            dataOp = dataOp.concat([
                {title: '确认已付款',id: 'paid'}
                ,{title: '关闭订单',id: 'close'}

            ]);
        }else if(d.order_status === 12){
            dataOp = dataOp.concat([
                {title: '确认发货',id: 'shipped'}
            ]);
        }else if(d.order_status === 20){
            dataOp = dataOp.concat([
                {title: '确认退货',id: 'returned'}
                ,{title: '确认完成',id: 'done'}
            ]);
        }else if(d.order_status === 42){
            dataOp = dataOp.concat([
                {title: '删除',id: 'del'}
            ]);
        }
      layui.dropdown.render({
        elem: that
        ,show: true //外部事件触发即显示
        ,data: dataOp
        ,click: function(data, othis){
            if(data.id === 'shipped'){
                Util.createFormWindow('/admin/order/confirm/shipped?id='+d.id, '确认发货');
                return;
            }
            layer.confirm('确定'+data.title+'?', function(index){
                //根据 id 做出不同操作
                if(data.id === 'del'){
                    $.post('/admin/order/destroy', {id:d.id}).then(response => {
                        if (response.code === 200) {
                            layer.close(index);
                            layer.msg(response.message, {time: 1500},function(){
                                obj.del();
                            });
                        }else{
                            layer.msg(response.message, {anim: 6});
                        }
                    });
                } else if(data.id === 'close'){
                    $.post('/admin/order/confirm/close', {id:d.id}).then(response => {
                        console.log(obj);
                        if (response.code === 200) {
                            layer.close(index);
                            layer.msg(response.message, {time: 1500});
                            //重载刷新
                            tableIns.reload();
                        }else{
                            layer.msg(response.message, {anim: 6});
                        }
                    });
                } else if(data.id === 'paid'){
                    $.post('/admin/order/confirm/paid', {id:d.id}).then(response => {
                        if (response.code === 200) {
                            layer.close(index);
                            layer.msg(response.message, {time: 1500});
                            //重载刷新
                            tableIns.reload();
                        }else{
                            layer.msg(response.message, {anim: 6});
                        }
                    });
                } else if(data.id === 'shipped'){
                    Util.createFormWindow('/admin/order/confirm/shipped?id='+d.id, '确认发货');
                } else if(data.id === 'returned'){
                    $.post('/admin/order/confirm/returned', {id:d.id}).then(response => {
                        if (response.code === 200) {
                            layer.close(index);
                            layer.msg(response.message, {time: 1500});
                            //重载刷新
                            tableIns.reload();
                        }else{
                            layer.msg(response.message, {anim: 6});
                        }
                    });
                } else if(data.id === 'done'){
                    $.post('/admin/order/confirm/done', {id:d.id}).then(response => {
                        if (response.code === 200) {
                            layer.close(index);
                            layer.msg(response.message, {time: 1500});
                            //重载刷新
                            tableIns.reload();
                        }else{
                            layer.msg(response.message, {anim: 6});
                        }
                    });
                }
            });
        }
        ,style: 'margin-left: -45px; box-shadow: 1px 1px 10px rgb(0 0 0 / 12%);' //设置额外样式
      }); 
    }
  });
}();
</script>
@endpush