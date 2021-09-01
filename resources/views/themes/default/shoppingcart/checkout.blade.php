@extends('layouts.app')

@section('content')
@include('layouts.includes.breadcrumb')
<!--主体区域-->
<div class="st-checkout">
    <form action="{{route('shoppingcart.createOrder')}}" method="post" id="ST-FORM">
        @csrf
        <input name="buyNow" type="hidden" value="{{request('buyNow',0)}}" />
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="panel panel-default st-checkout-address">
                        <div class="st-checkout-address-shipping">
                            <div class="page-header">
                                <h4>@lang('Shipping Address')</h4>
                            </div>
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label>@lang('Country')<span>*</span></label>
                                    <select class="form-control" name="country_code">
                                        <option value=""> -- {{__('Country')}} -- </option>
                                        @foreach($countries as $countryCode=>$country)
                                        <option value="{{$countryCode}}" @if($countryCode === ($default_address->country_code ?? '')) selected @endif>{{$country}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>@lang('First Name')<span>*</span></label>
                                    <input type="text" name="first_name" class="form-control" placeholder="@lang('First Name')" value="{{$default_address->first_name ?? ''}}" onchange="$('input[name=billing_first_name]').val(this.value)">
                                </div>
                                <div class="form-group">
                                    <label>@lang('Last Name')<span>*</span></label>
                                    <input type="text" name="last_name" class="form-control" placeholder="@lang('Last Name')" value="{{$default_address->last_name ?? ''}}" onchange="$('input[name=billing_last_name]').val(this.value)">
                                </div>
                                <div class="form-group">
                                    <label>@lang('Email Address')</label>
                                    <input type="text" name="email" class="form-control" placeholder="@lang('Email Address')" value="{{$default_address->email ?? ''}}" onchange="$('input[name=billing_email]').val(this.value)">
                                </div>
                                <div class="form-group">
                                    <label>@lang('Phone Number')<span>*</span></label>
                                    <input type="text" name="phone" class="form-control"  placeholder="@lang('Phone Number')" value="{{$default_address->phone ?? ''}}" onchange="$('input[name=billing_phone]').val(this.value)">
                                </div>
                                <div class="form-group">
                                    <label>@lang('Fax Number')</label>
                                    <input type="text" name="fax" class="form-control"  placeholder="@lang('Fax Number')" value="{{$default_address->fax ?? ''}}" onchange="$('input[name=billing_fax]').val(this.value)">
                                </div>
                                <div class="form-group">
                                    <label>@lang('Address Line 1')<span>*</span></label>
                                    <input type="text" name="address_line_1" class="form-control" placeholder="@lang('Address Line 1')" value="{{$default_address->address_line_1 ?? ''}}" onchange="$('input[name=billing_address_line_1]').val(this.value)">
                                    <p class="help-block">@lang('Please enter the address in english.')</p>
                                </div>
                                <div class="form-group">
                                    <label>@lang('Address Line 2')</label>
                                    <input type="text" name="address_line_2" class="form-control" placeholder="@lang('Address Line 2')" value="{{$default_address->address_line_2 ?? ''}}" onchange="$('input[name=billing_address_line_2]').val(this.value)">
                                </div>
                                <div class="form-group">
                                    <label>@lang('Town/City')<span>*</span></label>
                                    <input type="text" name="city" class="form-control" placeholder="@lang('Town/City')" value="{{$default_address->city ?? ''}}" onchange="$('input[name=billing_city]').val(this.value)">
                                </div>
                                <div class="form-group">
                                    <label>@lang('State/Province')<span>*</span></label>
                                    <div class="form-inline">
                                        <select class="form-control" name="state_code" onchange="$('select[name=billing_state_code]').val(this.value)">
                                            <option value=""> -- {{__('State/Province')}} -- </option>
                                            @foreach($states as $stateCode=>$state)
                                            <option value="{{$stateCode}}" @if($stateCode === ($default_address->state_code ?? '')) selected @endif>{{$state}}</option>
                                            @endforeach
                                        </select>
                                        <div class="st-h5"></div>
                                        <input type="text" name="state_other" class="form-control" placeholder="@lang('Other State/Province')" value="{{$default_address->state_other ?? ''}}" onchange="$('input[name=billing_state_other]').val(this.value)">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>@lang('Zip/Postal Code')<span>*</span></label>
                                    <input type="text" name="postal_code" class="form-control" placeholder="@lang('Zip/Postal Code')" value="{{$default_address->postal_code ?? ''}}" onchange="$('input[name=billing_postal_code]').val(this.value)">
                                </div>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label id="billingThisAddress">
                                            <input type="checkbox" name="billing_this_address" checked /> @lang('Billing this address')
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="st-checkout-address-billing hidden">
                            <div class="page-header">
                                <h4>@lang('Billing Address')</h4>
                            </div>
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label>@lang('Country')<span>*</span></label>
                                    <select class="form-control" name="billing_country_code">
                                        <option value=""> -- {{__('Country')}} -- </option>
                                        @foreach($countries as $countryCode=>$country)
                                        <option value="{{$countryCode}}" @if($countryCode === ($default_address->country_code ?? '')) selected @endif>{{$country}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>@lang('First Name')<span>*</span></label>
                                    <input type="text" name="billing_first_name" class="form-control" placeholder="@lang('First Name')" value="{{$default_address->first_name ?? ''}}">
                                </div>
                                <div class="form-group">
                                    <label>@lang('Last Name')<span>*</span></label>
                                    <input type="text" name="billing_last_name" class="form-control" placeholder="@lang('Last Name')" value="{{$default_address->last_name ?? ''}}">
                                </div>
                                <div class="form-group">
                                    <label>@lang('Email Address')</label>
                                    <input type="text" name="billing_email" class="form-control" placeholder="@lang('Email Address')" value="{{$default_address->email ?? ''}}">
                                </div>
                                <div class="form-group">
                                    <label>@lang('Phone Number')<span>*</span></label>
                                    <input type="text" name="billing_phone" class="form-control"  placeholder="@lang('Phone Number')" value="{{$default_address->phone ?? ''}}">
                                </div>
                                <div class="form-group">
                                    <label>@lang('Fax Number')</label>
                                    <input type="text" name="billing_fax" class="form-control"  placeholder="@lang('Fax Number')" value="{{$default_address->fax ?? ''}}">
                                </div>
                                <div class="form-group">
                                    <label>@lang('Address Line 1')<span>*</span></label>
                                    <input type="text" name="billing_address_line_1" class="form-control" placeholder="@lang('Address Line 1')" value="{{$default_address->address_line_1 ?? ''}}">
                                </div>
                                <div class="form-group">
                                    <label>@lang('Address Line 2')</label>
                                    <input type="text" name="billing_address_line_2" class="form-control" placeholder="@lang('Address Line 2')" value="{{$default_address->address_line_2 ?? ''}}">
                                </div>
                                <div class="form-group">
                                    <label>@lang('Town/City')<span>*</span></label>
                                    <input type="text" name="billing_city" class="form-control" placeholder="@lang('Town/City')" value="{{$default_address->city ?? ''}}">
                                </div>
                                <div class="form-group">
                                    <label>@lang('State/Province')<span>*</span></label>
                                    <div class="form-inline">
                                        <select class="form-control" name="billing_state_code">
                                            <option value=""> -- {{__('State/Province')}} -- </option>
                                            @foreach($states as $stateCode=>$state)
                                            <option value="{{$stateCode}}" @if($stateCode === ($default_address->state_code ?? '')) selected @endif>{{$state}}</option>
                                            @endforeach
                                        </select>
                                        <div class="st-h5"></div>
                                        <input type="text" name="billing_state_other" class="form-control" placeholder="@lang('Other State/Province')" value="{{$default_address->state_other ?? ''}}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>@lang('Zip/Postal Code')<span>*</span></label>
                                    <input type="text" name="billing_postal_code" class="form-control" placeholder="@lang('Zip/Postal Code')" value="{{$default_address->postal_code ?? ''}}">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-default st-checkout-shipingmethod">
                        <div class="page-header">
                            <h4>@lang('Shipping Options')</h4>
                        </div>
                        <div id="ST-SHIPPING_OPTIONS">
                            @include('layouts.includes.shippingOptions')
                        </div>
                    </div>
                    <div class="panel panel-default st-checkout-cartlist">
                        <div class="page-header">
                            <h4>@lang('Shopping Cart'): <font>{{$_current_currency_name}} {{$cart['total']['cart_total']}}</font> <a href="{{route('shoppingcart')}}" class="btn btn-default btn-xs pull-right">@lang('Update')</a></h4>
                        </div>
                        <table class="table st-cart-table">
                            <tbody>
                                @foreach($cart['rows'] as $row)
                                <tr>
                                    <td>
                                        <div class="media">
                                            <div class="media-left">
                                                <a href="{{route('product.show', ['id'=>$row['product_id']])}}">
                                                    <img class="media-object" src="{{$row['product']['img_cover']}}">
                                                </a>
                                            </div>
                                            <div class="media-body">
                                                <h5 class="media-heading">
                                                    <a href="{{route('product.show', ['id'=>$row['product_id']])}}">{{$row['product']['title']}}</a>
                                                </h5>
                                                <p class="st-itemcode"><small>Item code: {{$row['product']['sku']}}</small></p>
                                                <p class="st-specs">
                                                    <small>
                                                        @foreach($row['product']['specs'] as $spec)
                                                        {{$spec['name']}}:{{$spec['pivot']['spec_value']}}
                                                        @endforeach
                                                    </small>
                                                </p>
                                                <p class="st-price"><small>{{$_current_currency_name}} {{$row['product_price_now']}} x {{$row['qty']}}</small></p>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-default st-checkout-proceed">
                        <div class="page-header">
                            <h4>@lang('Payment Options')</h4>
                        </div>
                        @foreach($payment_options as $payment_option)
                        <div class="form-group">
                            <label>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="payment_option_id" value="{{$payment_option->id}}" @if ($loop->first)checked @endif > {{$payment_option->title}} 
                                    </label>
                                </div>
                                {{$payment_option->desc}}
                            </label>
                        </div>
                        @endforeach
                        @if(app('strongshop')->getShopConfig('use_credits'))
                        <div class="form-group form-inline">
                            <label>@lang('Use Credits'): </label>
                            <input class="form-control" value="" type="number" name="use_credits" />
                            <p class="help-block">
                                <small>
                                    @lang('You have <b>:have_credits</b> credits, The maximum credits for the order that you can use are <b>:viable_credits</b> credits.', ['have_credits'=>auth()->user()->pay_credits,'viable_credits'=>$viable_credits])
                                </small>
                            </p>
                        </div>
                        @endif
                        <hr />
                        <p>
                            <!--本地化语言翻译 复数表达式 请参考链接：https://learnku.com/docs/laravel/6.x/localization/5148#pluralization -->
                            <label>{{trans_choice('[0,1] Item total(:count item)|[2,99999]Item total(:count items)', $cart['total']['cart_qty_total'], ['count'=>$cart['total']['cart_qty_total']])}}:</label>
                            <font>{{$_current_currency_name}} {{$cart['total']['cart_total']}}</font>
                        </p>
                        <p>
                            <label>@lang('Shipping Cost'):</label>
                            <font>{{$_current_currency_name}} <span id="ST-shipping_fee"></span></font>
                        </p>
                        <p>
                            <label>@lang('Handing Cost'):</label>
                            <font>{{$_current_currency_name}} <span id="ST-handling_fee"></span></font>
                        </p>
                        <p>
                            <label>@lang('Tax Cost'):</label>
                            <font>{{$_current_currency_name}} <span id="ST-tax_fee"></span></font>
                        </p>
                        @if(app('strongshop')->getShopConfig('use_credits'))
                        <p><label>@lang('Use Credits'):</label><font>{{$_current_currency_name}} <span id="ST-used_credits_amount"></span></font></p>
                        @endif
                        <p>
                            <label><b>@lang('Order Total'):</b></label>
                            <font><b>{{$_current_currency_name}} <span id="ST-ORDER-TOTAL"></span></b></font>
                        </p>
                        <hr />
                        <p class="form-group">
                            <label>@lang('Order Remark')</label>
                            <textarea class="form-control" rows="3" name="remark" placeholder="@lang('Order Remark')"></textarea>
                        </p>
                        <p><button class="btn btn-warning" type="submit" name="submit_name" value="place_order"><span class="bi-credit-card"></span> @lang('PLACE MY ORDER') </button></p>
                        <!--<p><button class="btn btn-primary" type="submit" name="submit_name" value="paypal"><span class="bi-wallet-fill"></span> PAY WITH PAYPAL </button></p>-->
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div class="st-h20"></div>
</div>

<div class="st-h50 clearfix"></div>
@endsection
@push('scripts_bottom')
<script>
    !function () {
        //订单总计
        Util.getOrderTotal();
        //配送方式选择
        var timerOrder;
        $(document).on('change keyup', "input[name=shipping_option_id],input[name=payment_option_id],input[name=use_credits]", function (e) {
            clearTimeout(timerOrder);
            timerOrder = setTimeout(function () {
                Util.getOrderTotal();
            }, 500);
        });
        //账单地址
        $("#billingThisAddress").click(function () {
            var checked = $(this).find('input').is(':checked');
            if (checked) {
                $('.st-checkout-address-billing').removeClass('show').addClass('hidden');
            } else {
                $('.st-checkout-address-billing').removeClass('hidden').addClass('show');
            }
        });
        //配送地区联动
        $("select[name=country_code]").change(function () {
            var country_code = this.value;
            var buyNow = $("input[name=buyNow]").val();
            //同步到账单
            $("select[name=billing_country_code]").val(this.value);
            //获取省
            $.get('/common/region/states', {country_code: country_code}, function (res) {
                var option_html = "<option value=''> -- {{__('State/Province')}} -- </option>";
                $.each(res.data, function (i, item) {
                    option_html += '<option value="' + i + '">' + item + '</option>';
                });
                $("select[name=state_code]").html(option_html);
                $("select[name=billing_state_code]").html(option_html);
            });
            //获取配送方式
            $.get('/shoppingcart/shippingoptions', {country_code: country_code, buyNow: buyNow}, function (res) {
                console.log(res);
                $("#ST-SHIPPING_OPTIONS").html(res.content)
                Util.getOrderTotal();
            });

        });
        //账单地区联动
        $("select[name=billing_country_code]").change(function () {
            var country_code = this.value;
            $.get('/common/region/states', {country_code: country_code}, function (res) {
                var option_html = "<option value=''> -- {{__('State/Province')}} -- </option>";
                $.each(res.data, function (i, item) {
                    option_html += '<option value="' + i + '">' + item + '</option>';
                });
                $("select[name=billing_state_code]").html(option_html);
            });
        });
        $("button[type='submit']").click(function () {
            $('#ST-FORM').ajaxSubmit(function (res) {
                if (res.code !== 200) {
                    Util.showErrors(res.message);
                    return;
                }
                window.location.href = res.data.toUrl;
                return;
            });
            return false;
        });
    }
    ();
</script>
@endpush