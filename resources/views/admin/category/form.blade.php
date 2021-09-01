@extends('admin.layouts.app')
@push('styles')
<style></style>
@endpush
@push('scripts')
<script></script>
@endpush
@section('content')
<div class="st-h15"></div>
<form class="layui-form layui-form-pane" action="">
    <input name="id" type="hidden" value="{{$model->id}}" />
    <input name="level" type="hidden" value="{{$model->level}}" />
    <input name="parent_id" type="hidden" value="{{$model->parent_id}}" />
    <div class="layui-row">
        <div class="layui-col-xs11">
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('parent_id')}}</label>
                <div class="layui-input-block">
                    @if($model->id && ($model->level==2 || $model->level==3))
                    <select name="parent_id" disabled="">
                        <option value="">请选择</option>
                        @foreach ($menus as $menu)
                        <option value="{{$menu->id}}" @if($menu->id==$model->parent_id) selected @endif >{{$menu->name}}</option>
                        @endforeach
                    </select>
                    @else
                    <input type="text" name="parent_name" value="{{request('parent_name')}}" autocomplete="off" placeholder="" class="layui-input" readonly>
                    @endif
                    <div class="layui-word-aux st-form-tip st-form-tip-error"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('name')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="name" value="{{$model->name}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip st-form-tip-error"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('sort')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="sort" value="{{$model->sort}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip st-form-tip-error"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('status')}}</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="1" title="开启" @if($model->status==1)checked @endif>
                    <input type="radio" name="status" value="2" title="禁用" @if($model->status==2)checked @endif>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">{{$model->getAttributeLabel('meta_keywords')}}</label>
                <div class="layui-input-block">
                    <textarea name="meta_keywords" autocomplete="off" placeholder="" class="layui-textarea"></textarea>
                    <div class="layui-word-aux st-form-tip st-form-tip-error"></div>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">{{$model->getAttributeLabel('meta_description')}}</label>
                <div class="layui-input-block">
                    <textarea name="meta_description" autocomplete="off" placeholder="" class="layui-textarea"></textarea>
                    <div class="layui-word-aux st-form-tip st-form-tip-error"></div>
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
        //...
    }();
</script>
@endpush
