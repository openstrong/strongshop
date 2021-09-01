@extends('admin.layouts.app')

@push('styles')
<style></style>
@endpush

@push('scripts')
<script></script>
@endpush

@section('content')
<div class="st-h15"></div>
<form class="layui-form" action="">
    <input name="id" type="hidden" value="{{$model->id}}" />
    <div class="layui-row">
        <div class="layui-col-xs11">
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('category_id')}}</label>
                <div class="layui-input-block">
                    <select name="category_id" lay-ignore>
                        @foreach ($categories as $category)
                        @if(count($category->children)>0)
                        <optgroup label="{{$category->name}}">
                            @foreach ($category->children as $child)
                            <option value="{{$child->id}}" @if($model->category_id == $child->id)selected @endif>{{$child->name}}</option>
                            @endforeach
                        </optgroup>
                        @else
                        <option value="{{$category->id}}" @if($model->category_id == $category->id)selected @endif>{{$category->name}}</option>
                        @endif
                        @endforeach
                    </select>
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('title')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="title" value="{{$model->title}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('content')}}</label>
                <div class="layui-input-block">
                    <div id="div1">{!!$model->content!!}</div>
                    <textarea class="layui-textarea layui-hide" name="content" id="LAY_ditor" lay-verify="details">{!!$model->content!!}</textarea>
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('author')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="author" value="{{$model->author}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('status')}}</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="1" title="显示" @if($model->status==1)checked @endif>
                    <input type="radio" name="status" value="2" title="隐藏" @if($model->status==2)checked @endif>
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('sort')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="sort" value="{{$model->sort}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('meta_keywords')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="meta_keywords" value="{{$model->meta_keywords}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('meta_description')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="meta_description" value="{{$model->meta_description}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('origin')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="origin" value="{{$model->origin}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-form-item st-form-submit-btn">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="ST-SUBMIT">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
@endsection

@push('scripts_bottom')
<script>
    !function () {
        var form = layui.form, layedit = layui.layedit, laydate = layui.laydate;

        //创建一个编辑器
//        var editIndex = layedit.build('LAY_ditor', {
//            uploadImage: {url: '/admin/upload/image', type: 'post'},
//            tool: ['strong', , 'italic', 'underline', 'del', '|', 'left', 'center', 'right', '|', 'link', 'unlink', '|', 'image']
//        });
//        //自定义验证规则
//        form.verify({
//            details: function (value) {
//                layedit.sync(editIndex);
//            }
//        });
//        
        const E = window.wangEditor;
        const editor = new E('#div1');
        editor.config.uploadImgHeaders = {"X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')};//自定义header头
        editor.config.uploadImgServer = '/admin/upload/image/wangeditor'; // 配置 server 接口地址
        editor.config.uploadImgMaxSize = 2 * 1024 * 1024; // 2M 限制上传大小
        editor.config.uploadFileName = 'file';//上传文件名
        const $text1 = $('#LAY_ditor');
        editor.config.onchange = function (html) {
            // 第二步，监控变化，同步更新到 textarea
            $text1.val(html);
        };
        editor.create();
        // 第一步，初始化 textarea 的值
        $text1.val(editor.txt.html());
        
        //监听提交
//    layui.form.on('submit(ST-SUBMIT)', function (data) {
//        var postDatas = data.field;//表单数据
//        //提交json数据
//        var postDatas = JSON.stringify(postDatas);
        //        Util.postForm('#ST-FORM', postDatas, true, 'application/json;charset=utf-8');
//        return false;
//    });
    }();
</script>
@endpush
