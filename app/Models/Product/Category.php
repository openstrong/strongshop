<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Product;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{

    public $tableComments = '产品分类';
    protected $table = 'category';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];

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
            'status' => ['required', 'integer'],
            'sort' => ['integer'],
            'created_at' => ['date'],
            'updated_at' => ['date'],
            'meta_keywords' => ['nullable', 'string', 'max:255'],
            'meta_description' => ['nullable', 'string', 'max:255'],
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
            'id' => '分类id',
            'level' => '等级',
            'parent_id' => '上级分类',
            'name' => '分类名称',
            'status' => '状态',
            'sort' => '排序',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
            'meta_keywords' => 'MetaKeywords',
            'meta_description' => 'MetaDescription',
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

    public function children()
    {
        return $this->hasMany(self::class, 'parent_id', 'id')->orderByDesc('sort');
    }

    public function parent()
    {
        return $this->belongsTo(self::class, 'parent_id', 'id');
    }

}
