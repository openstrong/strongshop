<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{

    use Notifiable;

    protected $guarded = [];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token', 'api_token', 'wechat_open_id', 'wechat_union_id', 'qq_open_id', 'weibo_open_id', 'facebook_open_id', 'google_open_id',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

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
}
