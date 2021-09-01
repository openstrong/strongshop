<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class AdminMenu extends Model
{

    protected $table = 'admin_menu';
    public $tableComments = '菜单管理';
    protected $guarded = [];

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'level' => ['required', 'integer'],
            'parent_id' => ['required', 'integer'],
            'name' => ['required', 'string', 'max:100'],
            'route_url' => ['nullable', 'string', 'max:200', 'required_if:level,2,3'],
            'permissions' => ['string'],
            'status' => ['integer', 'in:1,2'],
            'sort' => ['integer'],
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
            'id' => '菜单id',
            'level' => '等级',
            'parent_id' => '上级菜单',
            'name' => '菜单名称',
            'route_url' => '菜单跳转地址',
            'permissions' => '操作权限',
            'status' => '状态 1显示,2隐藏',
            'sort' => '排序',
            'created_at' => '添加时间',
            'updated_at' => 'UPDATED_AT',
        ];
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
        return collect($data)->except($except)->only(array_keys($attributes))->toArray();
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

    public function children()
    {
        return $this->hasMany(self::class, 'parent_id', 'id')->orderByDesc('sort');
    }
    
    public function parent()
    {
        return $this->belongsTo(self::class, 'parent_id', 'id');
    }

}
