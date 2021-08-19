@extends('layouts.app')

@section('content')
<div class="st-user">
    <div class="st-h20"></div>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="panel panel-default st-user-wishlist">
                    <div class="panel-body table-responsive">
                        <div class="page-header">
                            <h4>@lang('Order Tracking')</h4>
                        </div>

                        @if(empty($row->order_no))
                        <p>
                        <form class="form-horizontal" method="post" action="{{route('user.orderTracking')}}">
                            @csrf
                            <div class="form-group">
                                <label class="col-md-2 control-label">@lang('Order NO.') <font>*</font></label>
                                <div class="col-md-8">
                                    <input name="order_no" type="text" class="form-control" value="{{request('order_no')}}" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-8">
                                    <button type="submit" class="btn btn-primary">@lang('Query')</button>
                                </div>
                            </div>
                        </form>
                        </p>
                        @else
                        <p><span class="label label-default">{{$row->order_status_label}}</span></p>
                        <h6>@lang('Order NO.'): {{$row->order_no ?? ''}}</h6>
                        <h6>
                            @lang('Tracking Number'): {{$row->tracking_no ?? ''}}
                            @if($row->shipping_remark)
                            <span class="label label-default">{{$row->shipping_remark}}</span>
                            @endif
                        </h6>
                        <div style="position: relative;">
                            <div style="width:101%;height: 57px; position: absolute;top:-1px;left: -2px;background: #fff;"></div>
                            <div style="width:101%;height: 138px; position: absolute;bottom:4px;left: -2px;background: #fff;"></div>
                            <div id="ST-ORDER-TRACK"></div>
                        </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="st-h20"></div>

</div>

<div class="st-h50 clearfix"></div>
@endsection
@push('scripts_bottom')
<script type="text/javascript" src="https://www.17track.net/externalcall.js"></script>
<script type="text/javascript">
YQV5.trackSingle({
    //必须，指定承载内容的容器ID。
    YQ_ContainerId: "ST-ORDER-TRACK",
    //可选，指定查询结果高度，最大为800px，默认为560px。
    YQ_Height: 560,
    //可选，指定运输商，默认为自动识别。
    YQ_Fc: "0",
    //必须，指定要查询的单号。 
    YQ_Num: "{{$row->tracking_no ?? ''}}"
});
</script>
@endpush('scripts_bottom')
