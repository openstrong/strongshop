<p class="st-total">
    <span>@lang('Cart Subtotal'):</span>
    <strong>{{$_current_currency_name}} <span class="ST-cart-cart_total">{{$_cart['total']['cart_total']}}</span></strong>
</p>
@if($_cart['total']['shipping_total'] !== false)
@if(config('strongshop.showCountriesInCart'))
<p class="st-total">
    <span>@lang('Shipping To'):</span>
    <select style="width:35%" name="_country_code" onchange="Util.fetchShoppingcartHtml();">
        @foreach($_countries as $_countryCode=>$_country)
        <option value="{{$_countryCode}}" @if($_countryCode === $_user_country_code) selected @endif>{{$_country}}</option>
        @endforeach
    </select>
</p>
@endif
@if(config('strongshop.showShipinglistInCart'))
<p class="st-total">
    <span>@lang('Shipping Options'):</span>
    <select style="width:35%" name="_shipping_option_id" onchange="Util.fetchShoppingcartHtml();">
        @foreach($_shipping_options as $_shipping_option)
        <option value="{{$_shipping_option['id']}}">{{$_shipping_option['title']}}</option>
        @endforeach
    </select>
</p>
@endif
<p class="st-total">
    <span>@lang('Shipping Cost'):</span>
    <strong>{{$_current_currency_name}} <span class="ST-cart-shipping_total">{{$_cart['total']['shipping_total']}}</span></strong>
</p>
@endif
<p>
    <a href="{{route('shoppingcart.checkout')}}" class="btn btn-warning">@lang('Proceed to checkout')</a>
</p>