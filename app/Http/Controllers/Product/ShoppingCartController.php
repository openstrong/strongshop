<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\Product;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use App\Models\Product\ShoppingCart;
use App\Models\Product\Product;
use App\Repositories\CartRepository;
use App\Repositories\ShippingRepository;

class ShoppingCartController extends Controller
{

    public function showIndexForm()
    {
        return view('shoppingcart.index');
    }

    public function fetchNavcartHtml(Request $request)
    {
        $data = CartRepository::getCart();
        if (config('strongshop.showShipingFeeInCart'))
        {
            //显示配送费用
            if ($request->shipping_option_id)
            {
                $shipping_total = ShippingRepository::getShippingFee($data['cart_weight'], $request->shipping_option_id, $request->country_code);
            } else
            {
                $shipping_fee_list = ShippingRepository::getShippingFeeList($data['cart_weight'], $request->country_code);
                $shipping_total = $shipping_fee_list[0]['fee'] ?: 0;
            }
        } else
        {
            $shipping_total = false; // false 表示不显示配送费用
        }
        $data['total']['shipping_total'] = $shipping_total;
        $content = (string) view('layouts.includes.navCart', ['_cart' => $data]);
        $data['content'] = $content;
        return ['code' => 200, 'message' => __('Success'), 'data' => $data];
    }

    public function fetchShoppingcartHtml(Request $request)
    {
        $data = CartRepository::getCart();
        if (config('strongshop.showShipingFeeInCart'))
        {
            //显示配送费用
            if ($request->shipping_option_id)
            {
                $shipping_total = ShippingRepository::getShippingFee($data['cart_weight'], $request->shipping_option_id, $request->country_code);
            } else
            {
                $shipping_fee_list = ShippingRepository::getShippingFeeList($data['cart_weight'], $request->country_code);
                $shipping_total = $shipping_fee_list[0]['fee'] ?? 0;
            }
        } else
        {
            $shipping_total = false; // false 表示不显示配送费用
        }
        $data['total']['shipping_total'] = $shipping_total;
        $content = (string) view('layouts.includes.shoppingcart', ['_cart' => $data]);
        $data['content'] = $content;
        return ['code' => 200, 'message' => __('Success'), 'data' => $data];
    }

    public function show()
    {
        $data = CartRepository::getCart();
        return ['code' => 200, 'message' => __('Success'), 'data' => $data];
    }

    public function create(Request $request)
    {
        $rules = [
            'product_id' => ['required', 'integer', Rule::exists('product', 'id')->where('status', 1)->whereNull('deleted_at')],
            'qty' => ['required', 'integer', 'min:1', 'max:99999'],
            'buyNow' => ['nullable', 'in:0,1'], //是否是立即购买
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        if (!$this->uuid)
        {
            return ['code' => 4001, 'message' => 'uuid not exists'];
        }
        $productModel = Product::find($request->product_id);
        if ($productModel->stock_status == 2)
        {
            return ['code' => 4003, 'message' => __('Ther product stockout.')];
        }
        //如果是立即购买
        if ($request->buyNow)
        {
            if (!$this->user)
            {
                return ['code' => 401, 'message' => __('Please sign in')];
            }
            ShoppingCart::query()->where('user_id', $this->user->id)->where('is_buy_now', 1)->delete();
            $model = new ShoppingCart();
            $model->user_id = $this->user ? $this->user->id : 0;
            $model->uuid = $this->uuid;
            $model->product_id = $request->product_id;
            $model->qty = $request->qty;
            $model->is_buy_now = 1;
            $model->product_price = $productModel->getOriginal('sale_price');
        } else
        {
            $query = ShoppingCart::query()
                    ->where('product_id', $request->product_id)
                    ->where('is_buy_now', 0)
                    ->where('uuid', $this->uuid);
            $model = $query->first();
            if ($model)
            {
                $model->user_id = $this->user ? $this->user->id : 0;
                $model->uuid = $this->uuid;
                $model->product_id = $request->product_id;
                $model->qty += $request->qty;
                $model->product_id = $request->product_id;
                $model->is_buy_now = 0;
                $model->product_price = $productModel->getOriginal('sale_price');
            } else
            {
                $model = new ShoppingCart();
                $model->user_id = $this->user ? $this->user->id : 0;
                $model->uuid = $this->uuid;
                $model->product_id = $request->product_id;
                $model->qty = $request->qty;
                $model->is_buy_now = 0;
                $model->product_price = $productModel->getOriginal('sale_price');
            }
        }
        //最小起订量限制
        if ($productModel->wholesale_set && !empty($productModel->wholesale_set['num']))
        {
            foreach ($productModel->wholesale_set['num'] as $numVal)
            {
                if ($model->qty >= $numVal)
                {
                    break;
                }
                return ['code' => 4004, 'message' => __('Ther product MOQ: :num', ['num' => $productModel->wholesale_set['num'][0]])];
            }
        }
        //检测库存
        if ($model->qty > $productModel->stock)
        {
            return ['code' => 4002, 'message' => __('Ther product only :num left.', ['num' => $productModel->stock])];
        }
        if ($model->save())
        {
            return ['code' => 200, 'message' => __('Success')];
        } else
        {
            return ['code' => 5001, 'message' => __('Server internal error')];
        }
    }

    public function update(Request $request)
    {
        $rules = [
            'product_id' => ['required', 'integer'],
            'qty' => ['required', 'integer', 'min:1', 'max:99999'],
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        if (!$this->uuid)
        {
            return ['code' => 4001, 'message' => 'uuid not exists'];
        }
        $query = ShoppingCart::query()->where('product_id', $request->product_id);
        if ($this->user)
        {
            $query->where('user_id', $this->user->id);
        } else
        {
            $query->where('uuid', $this->uuid);
        }
        $query->with('product:id,stock,stock_status,wholesale_set');
        $model = $query->first();
        if (!$model)
        {
            return ['code' => 4002, 'message' => 'product_id not exists'];
        }
        if ($model->product->stock_status == 2)
        {
            return ['code' => 4003, 'message' => __('Ther product stockout.')];
        }
        $model->qty = $request->qty;

        //最小起订量限制
        if ($model->product->wholesale_set && !empty($model->product->wholesale_set['num']))
        {
            foreach ($model->product->wholesale_set['num'] as $numVal)
            {
                if ($model->qty >= $numVal)
                {
                    break;
                }
                return ['code' => 4004, 'message' => __('Ther product MOQ: :num', ['num' => $model->product->wholesale_set['num'][0]])];
            }
        }

        //检测库存
        if ($model->qty > $model->product->stock)
        {
            return ['code' => 4004, 'message' => __('Ther product only :num left.', ['num' => $model->product->stock])];
        }

        if ($model->save())
        {
            return ['code' => 200, 'message' => __('Success')];
        } else
        {
            return ['code' => 5001, 'message' => __('Server internal error')];
        }
    }

    public function remove(Request $request)
    {
        $validator = Validator::make($request->all(), [
                    'product_id' => ['required'],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = is_array($request->product_id) ? $request->product_id : [$request->product_id];
        $model = ShoppingCart::whereIn('product_id', $ids);
        if ($this->user)
        {
            $model->where('user_id', $this->user->id);
        } else
        {
            $model->where('uuid', $this->uuid);
        }
        if ($model->delete())
        {
            return ['code' => 200, 'message' => __('Success')];
        } else
        {
            return ['code' => 5001, 'message' => __('Server internal error')];
        }
    }

}
