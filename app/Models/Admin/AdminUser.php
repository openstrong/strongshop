<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Admin;

use Illuminate\Foundation\Auth\User as Model;

class AdminUser extends Model
{

    public $tableComments = '账号管理';
    protected $table = 'admin_user';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];
    protected $hidden = ['password', 'remember_token'];

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'user_name' => ['required', 'string', 'max:50'],
            'role_id' => ['required', 'array'],
            'password' => ['nullable', 'string', 'max:100'],
            'remember_token' => ['string', 'max:100'],
            'name' => ['nullable', 'string', 'max:100'],
            'email' => ['nullable', 'string', 'max:255'],
            'phone' => ['nullable', 'string', 'max:255'],
            'avatar' => ['nullable', 'string', 'max:255'],
            'introduction' => ['nullable', 'string', 'max:255'],
            'status' => ['required', 'integer', 'in:1,2'],
            'last_ip' => ['string', 'max:255'],
            'last_at' => ['date'],
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
            'id' => '管理员id',
            'user_name' => '登录名',
            'role_id' => '角色',
            'password' => '登录密码',
            'remember_token' => '记住登录',
            'name' => '姓名',
            'email' => '邮箱',
            'phone' => '手机号',
            'avatar' => '头像',
            'introduction' => '介绍',
            'status' => '状态',
            'last_ip' => '最近一次登录ip',
            'last_at' => '最近一次登录时间',
            'created_at' => '添加时间',
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

    public function roles()
    {
        return $this->belongsToMany(AdminRole::class, 'admin_user_role');
    }

}
