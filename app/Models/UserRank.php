<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserRank extends Model
{
    public $tableComments = '会员等级';
    protected $table = 'user_rank';
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
            'min_credits' => ['required', 'integer'],
            'max_credits' => ['required', 'integer'],
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
            'name' => '等级名称',
            'min_credits' => '积分下限',
            'max_credits' => '积分上限',
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
