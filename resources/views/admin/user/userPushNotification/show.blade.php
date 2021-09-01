@extends('admin.layouts.app')

@push('styles')
<style></style>
@endpush

@push('scripts')
<script></script>
@endpush

@section('content')
<div class="st-h15"></div>
<table class="layui-table" lay-size="sm">
    <colgroup>
        <col width="150"><col>
        <col><col>
        <col width="150"><col>
        <col><col>
    </colgroup>
    <thead>
        <tr>
            <th colspan="4" style="text-align: center;background: #eee;">基本信息</th>
        </tr> 
    </thead>
    <tbody>
        <tr>
            <td><strong>{{$model->getAttributeLabel('type')}}</strong></td>
            <td>{{$model->type}}</td>
            <td><strong>{{$model->getAttributeLabel('title')}}</strong></td>
            <td>{{$model->title}}</td>
        </tr>
        <tr>
            <td><strong>{{$model->getAttributeLabel('content')}}</strong></td>
            <td>{{$model->content}}</td>
            <td><strong>{{$model->getAttributeLabel('admin_id')}}</strong></td>
            <td>{{$model->admin_id}}</td>
        </tr>
        <tr>
            <td><strong>{{$model->getAttributeLabel('send_at')}}</strong></td>
            <td>{{$model->send_at}}</td>
            <td><strong>{{$model->getAttributeLabel('status')}}</strong></td>
            <td>{{$model->status}}</td>
        </tr>
        <tr>
            <td><strong>{{$model->getAttributeLabel('created_at')}}</strong></td>
            <td>{{$model->created_at}}</td>
            <td><strong>{{$model->getAttributeLabel('updated_at')}}</strong></td>
            <td>{{$model->updated_at}}</td>
        </tr>
        <tr>
            <td><strong>{{$model->getAttributeLabel('deleted_at')}}</strong></td>
            <td>{{$model->deleted_at}}</td>
    </tbody>
</table>
@endsection

@push('scripts_bottom')
<script>
    !function () {
        //...
    }();
</script>
@endpush
