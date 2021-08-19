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
            <label class="layui-form-label">{{$model->getAttributeLabel('continent_iso2')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="continent_iso2" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div><div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('en_name')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="en_name" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('cn_name')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="cn_name" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
         <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('iso2')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="iso2" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> 
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('iso3')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="iso3" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('iso_num')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="iso_num" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('capital')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="capital" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('more')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="more" autocomplete="off" placeholder="" class="layui-input">
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
        <a class="layui-btn layui-btn-xs" href="/admin/region/regionContinent/index">大陆管理</a>
        <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/region/regionCountry/create', this.innerText);">添加</a>
        <a class="layui-btn layui-btn-xs" lay-event="batchDelete" data-href="/admin/region/regionCountry/destroy">删除选中</a>
    </div>
</script>
<script type="text/html" id="ST-OP-BUTTON">
    @verbatim
    <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/region/regionCountry/update?id={{d.id}}', this.innerText);">更新</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" onclick="Util.destroy('/admin/region/regionCountry/destroy?id={{d.id}}');">删除</a>
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
                , {field: 'continent_iso2', title: '{{$model->getAttributeLabel("continent_iso2")}}', width: 150, sort: true}
                , {field: 'continent_iso2', title: '大陆名称', width: 150, templet: function (res) {
                    return  res.continent.cn_name;
                    }}
                , {field: 'en_name', title: '{{$model->getAttributeLabel("en_name")}}', width: 150, sort: true}
                , {field: 'cn_name', title: '{{$model->getAttributeLabel("cn_name")}}', width: 150, sort: true}
                , {field: 'iso2', title: '{{$model->getAttributeLabel("iso2")}}', width: 150, sort: true}
                , {field: 'iso3', title: '{{$model->getAttributeLabel("iso3")}}', width: 150, sort: true}
                , {field: 'iso_num', title: '{{$model->getAttributeLabel("iso_num")}}', width: 150, sort: true}
                , {field: 'capital', title: '{{$model->getAttributeLabel("capital")}}', width: 150, sort: true}
                //, {field: 'more', title: '{{$model->getAttributeLabel("more")}}', width: 150, sort: true}
                , {fixed: 'right', title: '操作', toolbar: '#ST-OP-BUTTON', width: 150}
            ];
    var tableConfig = {
        cols: [cols]
        ,limit: 20 //每页条数
    };
    Util.renderTable(tableConfig);
}();
</script>
@endpush