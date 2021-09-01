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
        <div class="layui-col-xs12">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('user_name')}}</label>
                    <div class="layui-input-inline">
                        <input type="text" name="user_name" value="{{$model->user_name}}" autocomplete="off" placeholder="" class="layui-input">
                        <div class="layui-word-aux st-form-tip"></div>
                    </div>
                    <label class="layui-form-label">{{$model->getAttributeLabel('name')}}</label>
                    <div class="layui-input-inline">
                        <input type="text" name="name" value="{{$model->name}}" autocomplete="off" placeholder="" class="layui-input">
                        <div class="layui-word-aux st-form-tip"></div>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('email')}}</label>
                <div class="layui-input-inline">
                    <input type="text" name="email" value="{{$model->email}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
                <label class="layui-form-label">{{$model->getAttributeLabel('phone')}}</label>
                <div class="layui-input-inline">
                    <input type="text" name="phone" value="{{$model->phone}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('password')}}</label>
                <div class="layui-input-inline">
                    <input type="text" name="password" value="" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip">不填写则密码保持不变，填写后则会重置密码</div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('introduction')}}</label>
                <div class="layui-input-inline">
                    <textarea name="introduction" autocomplete="off" placeholder="" class="layui-textarea">{{$model->introduction}}</textarea>
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('status')}}</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="1" title="开启" @if($model->status==1)checked @endif>
                    <input type="radio" name="status" value="2" title="禁用" @if($model->status==2)checked @endif>
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <hr class="layui-bg-gray"/>

            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('role_id')}}</label>
                <div class="layui-input-block">
                    <?php $roles = \App\Models\Admin\AdminRole::get(); ?>
                    @foreach ($roles as $role)
                    <input type="checkbox" value="{{$role->id}}" name="role_id[]" lay-skin="primary" title="{{$role->name}}" @if($model->roles->pluck('id')->search($role->id) !== false) checked @endif>
                    @endforeach
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
        //...
    }();
</script>
@endpush
