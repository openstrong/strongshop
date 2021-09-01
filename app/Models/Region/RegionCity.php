<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Region;

use Illuminate\Database\Eloquent\Model;

class RegionCity extends Model
{
    public $tableComments = 'st_region_city';
    protected $table = 'region_city';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];
    
    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'country' => ['string', 'max:256'],
            'state' => ['string', 'max:256'],
            'city' => ['string', 'max:256'],
            'state_code' => ['string', 'max:64'],
            'city_code' => ['string', 'max:64'],
            'cn_city' => ['string', 'max:256'],
            'cn_state' => ['string', 'max:256'],
            'cn_country' => ['string', 'max:256'],
            'country_code' => ['string', 'max:64'],
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
            'country' => 'COUNTRY',
            'state' => 'STATE',
            'city' => 'CITY',
            'state_code' => 'STATE_CODE',
            'city_code' => 'CITY_CODE',
            'cn_city' => 'CN_CITY',
            'cn_state' => 'CN_STATE',
            'cn_country' => 'CN_COUNTRY',
            'country_code' => 'COUNTRY_CODE',
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
     * 城市列表
     */
    public function cities()
    {
        return $this->hasMany(RegionCity::class, 'state_code', 'state_code')->orderBy('city');
    }
}
