<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Region;

use Illuminate\Database\Eloquent\Model;

class RegionCountry extends Model
{

    public $tableComments = 'st_region_country';
    protected $table = 'region_country';
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
            'continent_iso2' => ['required', 'string', 'max:255'],
            'en_name' => ['required', 'string', 'max:255'],
            'cn_name' => ['required', 'string', 'max:255'],
            'iso2' => ['required', 'string', 'max:255'],
            'iso3' => ['required', 'string', 'max:255'],
            'iso_num' => ['string', 'max:255'],
            'capital' => ['string', 'max:255'],
            'more' => ['array'],
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
            'continent_iso2' => '大陆简码',
            'en_name' => '英文名称',
            'cn_name' => '中文名称',
            'iso2' => 'ISO二字简码',
            'iso3' => 'ISO三字简码',
            'iso_num' => 'ISO数字代码',
            'capital' => '首都',
            'more' => '更多配置',
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

    public function continent()
    {
        return $this->belongsTo(RegionContinent::class, 'continent_iso2', 'iso2');
    }

}
