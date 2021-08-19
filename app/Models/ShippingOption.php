<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShippingOption extends Model
{

    public $tableComments = '配送方式';
    protected $table = 'shipping_option';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];
    protected $casts = ['more' => 'json'];

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'title' => ['required', 'string', 'max:255'],
            'desc' => ['string', 'max:255'],
            'code' => ['required', 'string', 'max:100'],
            'status' => ['required', 'integer'],
            'more' => ['array'],
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
            'title' => '配送名称',
            'desc' => '描述',
            'code' => 'CODE',
            'status' => '状态',
            'more' => 'MORE',
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

    public function shippingOptionConfig()
    {
        return $this->hasOne(ShippingOptionConfig::class);
    }

}
