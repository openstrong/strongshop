<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Product;

use Illuminate\Database\Eloquent\Model;

class SpecGroup extends Model
{
    public $tableComments = '产品规格组';
    protected $table = 'spec_group';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];
    
    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'name' => ['required', 'string', 'max:255'],
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
            'id' => '规格组id',
            'name' => '组名称',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
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
}
