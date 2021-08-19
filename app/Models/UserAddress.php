<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserAddress extends Model
{
    public $tableComments = 'st_user_address';
    protected $table = 'user_address';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];
    
    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'user_id' => ['required', 'integer'],
            'first_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'max:255'],
            'phone' => ['required', 'string', 'max:255'],
            'fax' => ['string', 'max:255'],
            'country' => ['required', 'string', 'max:255'],
            'province' => ['required', 'string', 'max:255'],
            'city' => ['required', 'string', 'max:255'],
            'province_other' => ['string', 'max:255'],
            'address_line_1' => ['required', 'string', 'max:255'],
            'address_line_2' => ['string', 'max:255'],
            'postal_code' => ['required', 'string', 'max:255'],
            'is_default' => ['required', 'integer'],
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
            'user_id' => 'USER_ID',
            'first_name' => 'FIRST_NAME',
            'last_name' => 'LAST_NAME',
            'email' => 'EMAIL',
            'phone' => 'PHONE',
            'fax' => 'FAX',
            'country' => 'COUNTRY',
            'province' => 'PROVINCE',
            'city' => 'CITY',
            'province_other' => 'PROVINCE_OTHER',
            'address_line_1' => 'ADDRESS_LINE_1',
            'address_line_2' => 'ADDRESS_LINE_2',
            'postal_code' => 'POSTAL_CODE',
            'is_default' => 'IS_DEFAULT',
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
}
