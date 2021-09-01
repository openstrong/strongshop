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
                <label class="layui-form-label">{{$model->getAttributeLabel('first_name')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="first_name" value="{{$model->first_name}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('last_name')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="last_name" value="{{$model->last_name}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('nickname')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="nickname" value="{{$model->nickname}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('user_name')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="user_name" value="{{$model->user_name}}" autocomplete="off" placeholder="" class="layui-input" readonly="">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('email')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="email" value="{{$model->email}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('mobile')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="mobile" value="{{$model->mobile}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('password')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="password" value="" autocomplete="off" placeholder="" class="layui-input" data-tips="填写后即重置密码">
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
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('gender')}}</label>
                <div class="layui-input-block">
                    <input type="radio" name="gender" value="0" title="保密" @if($model->gender==0)checked @endif>
                    <input type="radio" name="gender" value="1" title="男" @if($model->gender==1)checked @endif>
                    <input type="radio" name="gender" value="2" title="女" @if($model->gender==2)checked @endif>
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">{{$model->getAttributeLabel('birthday')}}</label>
                <div class="layui-input-block">
                    <input type="date" name="birthday" value="{{$model->birthday}}" autocomplete="off" placeholder="" class="layui-input">
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('pay_credits')}}</label>
                <div class="layui-input-block">
                    <input type="text" name="pay_credits" value="{{$model->pay_credits}}" autocomplete="off" placeholder="" class="layui-input">
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
