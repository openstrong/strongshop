<table class="table st-cart-table">
    <tbody>
        @foreach($_cart['rows'] as $row)
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
                            <input name="qty" value="{{$row['qty']}}" type="number" data-productId="{{$row['product_id']}}" />
                        </p>
                    </div>
                </div>
            </td>
            <td>
                <button class="btn btn-default btn-xs glyphicon glyphicon-trash st-removecart" onclick="Util.removecart({{$row['product_id']}})"></button>
            </td>
        </tr>
        @endforeach
    </tbody>
</table>
