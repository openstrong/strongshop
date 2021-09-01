<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Product;

use Illuminate\Database\Eloquent\Model;

class Spec extends Model
{

    public $tableComments = '产品规格表';
    protected $table = 'spec';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'spec_group_id' => ['required', 'integer'],
            'name' => ['required', 'string', 'max:255'],
            'spec_type' => ['required', 'integer'],
            'input_type' => ['required', 'integer'],
            'select_values' => ['required_if:input_type,1', 'nullable', 'string'],
            'created_at' => ['date'],
            'updated_at' => ['date'],
            'is_show_img' => ['integer'],
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
            'id' => '规格id',
            'spec_group_id' => '规格组',
            'name' => '规格名称',
            'spec_type' => '规格类型',
            'input_type' => '录入方式',
            'select_values' => '可选值',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
            'is_show_img' => '显示规格图',
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

    public function getSelectValuesArrayAttribute($value)
    {
        if ($value)
        {
            return explode("\n", $value);
        }
        return [];
    }

    public function specGroup()
    {
        return $this->belongsTo(SpecGroup::class, 'spec_group_id');
    }

}
