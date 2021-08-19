<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Product;

use Illuminate\Database\Eloquent\Model;
use App\Repositories\AppRepository;

class ShoppingCart extends Model
{

    public $tableComments = '购物车';
    protected $table = 'shopping_cart';
    protected $hidden = ['uuid'];
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];
    protected $appends = ['product_price_now'];

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'user_id' => ['required', 'integer'],
            'uuid' => ['required', 'string', 'max:100'],
            'product_id' => ['required', 'integer'],
            'prduct_price' => ['required', 'numeric'],
            'qty' => ['required', 'integer'],
            'created_at' => ['date'],
            'updated_at' => ['date'],
        ];
    }

    /**
     * Validator messages
     * @return type
     */
    public function messages()
    {
        return [];
    }

    /**
     * Validator customAttributes
     * @return type
     */
    public function customAttributes()
    {
        return [
            'id' => 'ID',
            'user_id' => '用户id',
            'uuid' => 'UUID',
            'product_id' => 'PRODUCT_ID',
            'prduct_price' => 'PRDUCT_PRICE',
            'qty' => '数量',
            'created_at' => 'CREATED_AT',
            'updated_at' => 'UPDATED_AT',
        ];
    }

    public function getAttributeLabel($key)
    {
        $datas = $this->customAttributes();
        return $datas[$key] ?? $key;
    }

    /**
     * Fill the model with an array of attributes.
     * @param type $attributes
     * @return $this
     */
    public function fill($attributes)
    {
        foreach ($attributes as $key => $attribute)
        {
            if ($attribute === null)
            {
                unset($attributes[$key]);
            }
        }
        parent::fill($attributes);
        return $this;
    }

    /**
     * 加入购物车时的价格
     * @param type $value
     * @return type
     */
    public function getProductPriceAttribute($value)
    {
        return AppRepository::convertCurrency($value);
    }

    /**
     * 结算价格
     * @return type
     */
    public function getProductPriceNowAttribute()
    {
        $value = $this->product->sale_price;
        $wholesale_set = isset($this->product->wholesale_set['num']) ? $this->product->wholesale_set : null; //批发配置
        if (!$wholesale_set)
        {
            return $value;
        }
        $qty = $this->getAttribute('qty');
        foreach ($wholesale_set['num'] as $key => $val)
        {
            if ($qty >= $val)
            {
                $value = $wholesale_set['price'][$key];
            }
        }
        return $value;
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

}
