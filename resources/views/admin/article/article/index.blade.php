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
            <label class="layui-form-label">{{$model->getAttributeLabel('cate_id')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="cate_id" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div><div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('title')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="title" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('content')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="content" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('author')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="author" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('status')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="status" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('sort')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="sort" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('created_at')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="created_at" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('updated_at')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="updated_at" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('deleted_at')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="deleted_at" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('meta_keywords')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="meta_keywords" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <!-- <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('meta_description')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="meta_description" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div> -->
        <div class="layui-inline">
            <label class="layui-form-label">{{$model->getAttributeLabel('created_at')}}</label>
            <div class="layui-input-inline">
                <input type="text" name="created_at_begin" id="date" placeholder="???-???-???" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-input-inline">
                <input type="text" name="created_at_end" id="date2" placeholder="???-???-???" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <a class="layui-btn layui-btn-xs st-search-button">????????????</a>
        </div>
    </div>
</form>
<table class="layui-hide" id="ST-TABLE-LIST" lay-filter="ST-TABLE-LIST"></table>
<script type="text/html" id="ST-TOOL-BAR">
    <div class="layui-btn-container st-tool-bar">
        <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/article/article/create', this.innerText, ['80%', '90%']);">??????</a>
        <a class="layui-btn layui-btn-xs" lay-event="batchDelete" data-href="/admin/article/article/destroy">????????????</a>
    </div>
</script>
<script type="text/html" id="ST-OP-BUTTON">
    @verbatim
    <a class="layui-btn layui-btn-xs" onclick="Util.createFormWindow('/admin/article/article/update?id={{d.id}}', this.innerText, ['80%', '90%']);">??????</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" onclick="Util.destroy('/admin/article/article/destroy?id={{d.id}}');">??????</a>
    @endverbatim
</script>
@endsection
@push('scripts_bottom')        
<script>
!function () {
    //??????
    layui.laydate.render({
        elem: '#date'
    });
    layui.laydate.render({
        elem: '#date2'
    });
    //????????????
    var cols = [
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'id', width: 60, fixed: 'left', unresize: true, totalRowText: '??????', sort: true}
                , {field: 'category_id', title: '{{$model->getAttributeLabel("category_id")}}', width: 150, sort: true, templet: function(res){
                        return res.category ? res.category.name : '';
                }}
                , {field: 'title', title: '{{$model->getAttributeLabel("title")}}', width: 350, sort: true}
                , {field: 'author', title: '{{$model->getAttributeLabel("author")}}', width: 150, sort: true}
                , {field: 'status', title: '{{$model->getAttributeLabel("status")}}', width: 80, sort: true, templet: function (res) {
                    return  res.status==1  ? '<span class="layui-badge layui-bg-green">??????</span>' : '<span class="layui-badge">??????</span>';
                    }}
                , {field: 'sort', title: '{{$model->getAttributeLabel("sort")}}', width: 150, sort: true}
                , {field: 'created_at', title: '{{$model->getAttributeLabel("created_at")}}', width: 150, sort: true}
                , {field: 'updated_at', title: '{{$model->getAttributeLabel("updated_at")}}', width: 150, sort: true}
                , {field: 'deleted_at', title: '{{$model->getAttributeLabel("deleted_at")}}', width: 150, sort: true}
                , {fixed: 'right', title: '??????', toolbar: '#ST-OP-BUTTON', width: 150}
            ];
    var tableConfig = {
        cols: [cols]
    };
    Util.renderTable(tableConfig);
}();
</script>
@endpush