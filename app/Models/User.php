<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Repositories\RegionRepository;

class User extends Authenticatable implements MustVerifyEmail
{

    use Notifiable;

    use \Illuminate\Database\Eloquent\SoftDeletes;

    public $tableComments = '会员表';
    protected $table = 'user';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];
    protected $hidden = [
        'password', 'remember_token', 'api_token', 'wechat_open_id', 'wechat_union_id', 'qq_open_id', 'weibo_open_id', 'facebook_open_id', 'google_open_id',
    ];
    protected $appends = ['country'];

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'first_name' => ['string', 'max:255'],
            'last_name' => ['string', 'max:255'],
            'nickname' => ['nullable', 'string', 'max:255'],
            'user_name' => ['nullable', 'string', 'max:100'],
            'email' => ['required', 'email', 'max:100'],
            'email_verified_at' => ['date'],
            'mobile' => ['nullable', 'string', 'max:100'],
            'mobile_verified_at' => ['date'],
            'password' => ['nullable', 'string', 'max:255'],
            'remember_token' => ['string', 'max:100'],
            'api_token' => ['string', 'max:100'],
            'created_at' => ['date'],
            'updated_at' => ['date'],
            'status' => ['required', 'integer', 'in:1,2'],
            'last_login_at' => ['date'],
            'last_login_ip' => ['string', 'max:255'],
            'avatar' => ['string', 'max:500'],
            'gender' => ['nullable', 'integer'],
            'birthday' => ['nullable', 'date'],
            'country_code' => ['nullable', 'string'],
            'wechat_open_id' => ['string', 'max:100'],
            'wechat_union_id' => ['string', 'max:100'],
            'qq_open_id' => ['string', 'max:100'],
            'weibo_open_id' => ['string', 'max:100'],
            'facebook_open_id' => ['string', 'max:100'],
            'google_open_id' => ['string', 'max:100'],
            'pay_credits' => ['integer', 'min:0'],
            'rank_credits' => ['integer', 'min:0'],
        ];
    }

    public function customRules()
    {
        
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
            'id' => '会员id',
            'first_name' => '名',
            'last_name' => '姓',
            'nickname' => '昵称',
            'user_name' => '登录名称',
            'email' => '登录邮箱',
            'email_verified_at' => '邮箱验证时间',
            'mobile' => '手机号码',
            'mobile_verified_at' => '手机号验证时间',
            'password' => '登录密码',
            'remember_token' => 'REMEMBER_TOKEN',
            'api_token' => 'api',
            'created_at' => '注册时间',
            'updated_at' => '更新时间',
            'status' => '状态',
            'last_login_at' => '最近一次登录日期',
            'last_login_ip' => '最近一次登录ip',
            'avatar' => '头像',
            'gender' => '性别',
            'birthday' => '生日',
            'country_code' => '国家',
            'wechat_open_id' => '微信openid',
            'wechat_union_id' => '微信unionid',
            'qq_open_id' => 'QQ开放id',
            'weibo_open_id' => '微博开放id',
            'facebook_open_id' => 'Facebook开放id',
            'google_open_id' => 'Google开放id',
            'pay_credits' => '支付积分',
            'rank_credits' => '信用积分',
            'source' => '来源',
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
     * 昵称
     * @return string
     */
    public function getNicknameAttribute($value)
    {
        if (!$value && isset($this->attributes['first_name']))
        {
            return $this->attributes['first_name'];
        }
        return $value;
    }

    /**
     * 国家名称
     * @return string
     */
    public function getCountryAttribute()
    {
        if (isset($this->attributes['country_code']))
        {
            return RegionRepository::getCountry($this->attributes['country_code']);
        }
        return '';
    }

    /**
     * 会员的订单列表
     */
    public function orders()
    {
        return $this->hasMany(Order\Order::class);
    }

}
