<table class="table st-cart-table">
    <tbody>
        @forelse($_cart['rows'] as $row)
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
                        <p class="st-itemcode"><small>@lang('Item code #'): {{$row['product']['sku']}}</small></p>
                        <p class="st-specs">
                            <small>
                                @foreach($row['product']['specs'] as $spec)
                                {{$spec['name']}}:{{$spec['pivot']['spec_value']}} 
                                @endforeach
                            </small>
                        </p>
                        <p class="st-price">
                            <span>{{$_current_currency_name}} {{$row['product_price_now']}}</span> x 
                            <input name="qty" value="{{$row['qty']}}" type="number" onchange="Util.updatecart({{$row['product_id']}}, this.value);" onkeyup="Util.updatecart({{$row['product_id']}}, this.value);" />
                        </p>
                    </div>
                </div>
            </td>
            <td class="st-wholesale hidden-xs">
                <table class="table">
                    <tbody>
                        @foreach($row['product']['wholesale_set']['num'] as $wholesale_num)
                        <tr>
                            <td>
                                @if($loop->last) <font>≥</font> @else <font>≥</font> @endif
                                {{$wholesale_num}}
                            </td>
                            <td>{{$_current_currency_name}} {{$row['product']['wholesale_set']['price'][$loop->index]}}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </td>
            <td>
                <button class="btn btn-default btn-xs glyphicon glyphicon-trash st-removecart" onclick="Util.removecart({{$row['product_id']}})"></button>
            </td>
        </tr>
        @empty
    <p class="text-center">@lang('No data.') <a href='/'>@lang('Go Home')</a></p>
    @endforelse
</tbody>
</table>
