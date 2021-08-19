<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Region;

use Illuminate\Database\Eloquent\Model;

class RegionContinent extends Model
{

    public $tableComments = '大陆表';
    protected $table = 'region_continent';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'iso2' => ['required', 'string', 'max:16'],
            'cn_name' => ['required', 'string', 'max:16'],
            'en_name' => ['required', 'string', 'max:16'],
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
            'id' => '自增id',
            'iso2' => 'ISO二字代码',
            'cn_name' => '中文名',
            'en_name' => '英文名',
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
