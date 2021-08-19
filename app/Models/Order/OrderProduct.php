<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Order;

use Illuminate\Database\Eloquent\Model;

class OrderProduct extends Model
{

    public $tableComments = '订单产品';
    protected $table = 'order_product';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];
    protected $casts = ['specs' => 'json'];
    protected $appends = ['subtotal'];

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'order_id' => ['required', 'integer'],
            'product_id' => ['required', 'integer'],
            'title' => ['required', 'string', 'max:255'],
            'sku' => ['required', 'string', 'max:100'],
            'currency_code' => ['required', 'string', 'max:50'],
            'original_price' => ['required', 'numeric'],
            'sale_price' => ['required', 'numeric'],
            'img_cover' => ['string', 'max:255'],
            'specs' => ['string'],
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
            'order_id' => '订单id',
            'product_id' => '产品id',
            'title' => '产品标题',
            'sku' => 'SKU',
            'currency_code' => '结算货币',
            'original_price' => '原价',
            'sale_price' => '售价',
            'img_cover' => '产品封面图',
            'specs' => '已选规格',
            'qty' => '已购数量',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
            'weight' => '重量(g)',
            'currency_rate' => '转换率',
            'subtotal' => '价格小计',
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

    public function getCurrencyRateAttribute($value)
    {
        return floatval($value);
    }

    public function getSpecsAttribute($value)
    {
        return $value ? json_decode($value) : [];
    }

    public function getSubtotalAttribute($value)
    {
        $qty = $this->attributes['qty'];
        $sale_price = $this->attributes['sale_price'];
        $number = $qty * $sale_price;
        return app('strongshop')->dedimalTruncate($number);
    }

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

}
