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
            <td><strong>{{$model->getAttributeLabel('iso2')}}</strong></td>
            <td>{{$model->iso2}}</td>
            <td><strong>{{$model->getAttributeLabel('cn_name')}}</strong></td>
            <td>{{$model->cn_name}}</td>
        </tr>
        <tr>
            <td><strong>{{$model->getAttributeLabel('en_name')}}</strong></td>
            <td>{{$model->en_name}}</td>
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
