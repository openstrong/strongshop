<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserFeedback extends Model
{

    use \Illuminate\Database\Eloquent\SoftDeletes;

    public $tableComments = '意见反馈表';
    protected $table = 'user_feedback';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'type' => ['required', 'integer'],
            'user_id' => ['required', 'integer'],
            'title' => ['required', 'string', 'max:100'],
            'content' => ['string', 'max:65535'],
            'content_reply' => ['string', 'max:65535'],
            'more' => ['string'],
            'status' => ['required', 'integer'],
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
            'id' => '反馈id',
            'type' => '反馈类型',
            'user_id' => '反馈用户',
            'title' => '标题',
            'content' => '内容',
            'content_reply' => '回复内容',
            'more' => '更多内容',
            'status' => '状态',
            'created_at' => 'CREATED_AT',
            'updated_at' => 'UPDATED_AT',
            'admin_id' => '回复管理员'
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

    public function getTitleAttribute($value)
    {
        if (!$value)
        {
            $value = $this->attributes['content'];
        }
        return mb_substr(strip_tags($value), 0, 150);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function adminUser()
    {
        return $this->belongsTo(Admin\AdminUser::class, 'admin_id');
    }

    public function replies()
    {
        return $this->hasMany(self::class, 'parent_id', 'id');
    }

    public function unreadReplies()
    {
        return $this->hasMany(self::class, 'parent_id', 'id')->whereNull('read_at');
    }

}
