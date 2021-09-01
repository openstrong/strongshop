<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class WebConfig extends Model
{

    public $tableComments = '网站设置';
    protected $table = 'webconfig';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];
    protected $casts = ['more' => 'json'];

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'key' => ['required', 'string', 'max:255'],
            'value' => ['nullable', 'string', 'max:255'],
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
            'key' => '键名',
            'value' => '键值',
            'more' => '配置项值',
            'is_sys' => '默认类型',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
        ];
    }

    public function getAttributeLabel($key)
    {
        $datas = $this->customAttributes();
        return $datas[$key] ?? $key;
    }

}
