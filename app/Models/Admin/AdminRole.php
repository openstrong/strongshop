<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class AdminRole extends Model
{

    protected $table = 'admin_role';
    public $tableComments = '角色表';
    protected $guarded = [];
    protected $casts = ['permissions' => 'json'];
    
    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'name' => ['required', 'string', 'max:50'],
            'desc' => ['nullable', 'string', 'max:255'],
            'permissions' => ['array'],
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
            'id' => '角色id',
            'name' => '角色名称',
            'desc' => '角色描述',
            'permissions' => '拥有的权限',
            'created_at' => '添加时间',
            'updated_at' => 'UPDATED_AT',
        ];
    }

    public function getAttributeLabel($key)
    {
        $datas = $this->customAttributes();
        return $datas[$key] ?? $key;
    }

    /**
     * Filter Request Attributes and Retain only customAttributes
     * @param array $data
     * @param type $append_except
     * @return type
     */
    public function onlyCustomAttributes(array $data, array $append_except = [])
    {
        $except = array_merge_recursive($append_except, ['id', 'created_at', 'updated_at', 'deleted_at']);
        $attributes = $this->customAttributes();
        return collect($data)->except($except)->only(array_keys($attributes))->except($except)->toArray();
    }

    /**
     * Fill the model with an array of attributes.
     * @param type $attributes
     * @return $this
     */
    public function fill($attributes)
    {
        $onlyCustomAttributes = $this->onlyCustomAttributes($attributes);
        parent::fill($onlyCustomAttributes);
        return $this;
    }

}
