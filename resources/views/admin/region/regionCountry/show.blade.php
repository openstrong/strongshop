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
            <td><strong>{{$model->getAttributeLabel('continent_iso2')}}</strong></td>
            <td>{{$model->continent_iso2}}</td>
            <td><strong>{{$model->getAttributeLabel('en_name')}}</strong></td>
            <td>{{$model->en_name}}</td>
        </tr>
        <tr>
            <td><strong>{{$model->getAttributeLabel('cn_name')}}</strong></td>
            <td>{{$model->cn_name}}</td>
            <td><strong>{{$model->getAttributeLabel('iso2')}}</strong></td>
            <td>{{$model->iso2}}</td>
        </tr>
        <tr>
            <td><strong>{{$model->getAttributeLabel('iso3')}}</strong></td>
            <td>{{$model->iso3}}</td>
            <td><strong>{{$model->getAttributeLabel('iso_num')}}</strong></td>
            <td>{{$model->iso_num}}</td>
        </tr>
        <tr>
            <td><strong>{{$model->getAttributeLabel('capital')}}</strong></td>
            <td>{{$model->capital}}</td>
            <td><strong>{{$model->getAttributeLabel('more')}}</strong></td>
            <td>{{$model->more}}</td>
        </tr>
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
