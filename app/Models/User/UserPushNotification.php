<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\User;

use Illuminate\Database\Eloquent\Model;
use App\Models\Admin\AdminUser;

class UserPushNotification extends Model
{

    public $tableComments = '会员发送通知（邮件）记录表';
    protected $table = 'user_push_notification';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at', 'send_at'];

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'type' => ['integer'],
            'title' => ['required', 'string', 'max:255'],
            'content' => ['required', 'string', 'max:4294967295'],
            'admin_id' => ['integer'],
            'send_at' => ['date'],
            'created_at' => ['date'],
            'updated_at' => ['date'],
            'deleted_at' => ['date'],
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
            'type' => '通知类型',
            'title' => '标题',
            'content' => '内容',
            'admin_id' => '操作者',
            'send_at' => '发送时间',
            'status' => '发送状态',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
            'deleted_at' => '删除时间',
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

    public function adminUser()
    {
        return $this->belongsTo(AdminUser::class, 'admin_id');
    }

}
