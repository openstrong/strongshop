<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class AdminLog extends Model
{

    protected $table = 'admin_log';
    public $tableComments = '操作日志表';
    protected $guarded = [];
    protected $casts = ['log_dirty' => 'json', 'log_original' => 'json'];

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'route_url' => ['required', 'string', 'max:200'],
            'desc' => ['string', 'max:255'],
            'admin_user_id' => ['integer'],
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
            'route_url' => '路由',
            'desc' => '操作描述',
            'log_original' => '字段变更前内容',
            'log_dirty' => '字段变更后内容',
            'admin_user_id' => '操作用户',
            'created_at' => '操作时间',
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

    public function adminUser()
    {
        return $this->belongsTo(AdminUser::class);
    }

}
