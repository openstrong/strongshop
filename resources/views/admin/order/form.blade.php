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
    <div class="layui-tab layui-tab-brief">
        <ul class="layui-tab-title">
            <li class="layui-this">基础信息</li>
            <li>费用信息</li>
            <li>配送地址</li>
            <li>账单地址</li>
        </ul>
        <div class="layui-tab-content">
            <!--基本信息-->
            <div class="layui-tab-item layui-show">
                <div class="layui-row">
                    <div class="layui-col-xs11">
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('order_no')}}</label>
                            <div class="layui-input-block">
                                <input type="text" name="order_no" value="{{$model->order_no}}" autocomplete="off" placeholder="" class="layui-input" readonly="">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('shipping_option_id')}}</label>
                            <div class="layui-input-inline">
                                <select name="shipping_option_id">
                                    @foreach ($shipping_options as $shipping)
                                    <option value="{{$shipping->id}}" @if($model->shipping_option_id == $shipping->id)selected @endif>{{$shipping->title}}</option>
                                    @endforeach
                                </select>
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                            <label class="layui-form-label">{{$model->getAttributeLabel('tracking_no')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="tracking_no" value="{{$model->tracking_no}}" autocomplete="off" placeholder="{{$model->getAttributeLabel('tracking_no')}}" class="layui-input">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                            <label class="layui-form-label"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('shipping_remark')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="shipping_remark" value="{{$model->shipping_remark}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip">可填写具体配送公司等信息，此信息在前台订单详情显示</div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('payment_option_id')}}</label>
                            <div class="layui-input-block">
                                <select name="payment_option_id">
                                    @foreach ($payment_options as $payment)
                                    <option value="{{$payment->id}}" @if($model->payment_option_id == $payment->id)selected @endif>{{$payment->title}}</option>
                                    @endforeach
                                </select>
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">{{$model->getAttributeLabel('remark')}}</label>
                            <div class="layui-input-block">
                                <textarea  name="remark" autocomplete="off" placeholder="" class="layui-textarea"  readonly="">{{$model->remark}}</textarea>
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
            <!--费用信息-->
            <div class="layui-tab-item">
                <div class="layui-row">
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('currency_code')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="currency_code" value="{{$model->currency_code}}" autocomplete="off" placeholder="" class="layui-input" readonly="">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('products_amount')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="products_amount" value="{{$model->products_amount}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('shipping_fee')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="shipping_fee" value="{{$model->shipping_fee}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('handling_fee')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="handling_fee" value="{{$model->handling_fee}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('discount_amount')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="discount_amount" value="{{$model->discount_amount}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('used_credits_amount')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="used_credits_amount" value="{{$model->used_credits_amount}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('order_amount')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="order_amount" value="{{$model->order_amount}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('paid_amount')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="paid_amount" value="{{$model->paid_amount}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!--配送地址-->
            <div class="layui-tab-item">
                <div class="layui-row">
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('first_name')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="first_name" value="{{$model->first_name}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('last_name')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="last_name" value="{{$model->last_name}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('email')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="email" value="{{$model->email}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('phone')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="phone" value="{{$model->phone}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">{{$model->getAttributeLabel('fax')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="fax" value="{{$model->fax}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('country_code')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="country_code" value="{{$model->country_code}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('state_code')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="state_code" value="{{$model->state_code}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">{{$model->getAttributeLabel('state_other')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="state_other" value="{{$model->state_other}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('city')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="city" value="{{$model->city}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('address_line_1')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="address_line_1" value="{{$model->address_line_1}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">{{$model->getAttributeLabel('address_line_2')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="address_line_2" value="{{$model->address_line_2}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('postal_code')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="postal_code" value="{{$model->postal_code}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!--账单地址-->
            <div class="layui-tab-item">
                <div class="layui-row">
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('billing_first_name')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="billing_first_name" value="{{$model->billing_first_name}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('billing_last_name')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="billing_last_name" value="{{$model->billing_last_name}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('billing_email')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="billing_email" value="{{$model->billing_email}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('billing_phone')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="billing_phone" value="{{$model->billing_phone}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">{{$model->getAttributeLabel('billing_fax')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="billing_fax" value="{{$model->billing_fax}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('billing_country_code')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="billing_country_code" value="{{$model->billing_country_code}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('billing_state_code')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="billing_state_code" value="{{$model->billing_state_code}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">{{$model->getAttributeLabel('billing_state_other')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="billing_state_other" value="{{$model->billing_state_other}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('billing_city')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="billing_city" value="{{$model->billing_city}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('billing_address_line_1')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="billing_address_line_1" value="{{$model->billing_address_line_1}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">{{$model->getAttributeLabel('billing_address_line_2')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="billing_address_line_2" value="{{$model->billing_address_line_2}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('billing_postal_code')}}</label>
                        <div class="layui-input-block">
                            <input type="text" name="billing_postal_code" value="{{$model->billing_postal_code}}" autocomplete="off" placeholder="" class="layui-input">
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
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
