@forelse($shipping_options as $shipping_option)
<div class="form-group">
    <label>
        <div class="radio">
            <label>
                <input type="radio" name="shipping_option_id" value="{{$shipping_option['id']}}" @if ($loop->first)checked @endif > {{$shipping_option['title']}} 
                <br/>
                <strong class="badge">{{$_current_currency_name}} <span class="st-shipping-option-fee">{{$shipping_option['fee']}}</span></strong>
            </label>
        </div>
        {{$shipping_option['desc']}}
    </label>
</div>
@empty
<p>
    @lang('No shipping options. <a href=":href">Feedback us </a>', ['href'=>route('user.my.feedback')])
</p>
@endforelse