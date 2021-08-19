<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Article extends Model
{

    use \Illuminate\Database\Eloquent\SoftDeletes;

    public $tableComments = '文章表';
    protected $table = 'article';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];
    protected $appends = ['brief'];

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'category_id' => ['required', 'integer', 'min:1'],
            'title' => ['required', 'string', 'max:100'],
            'cover_img' => ['nullable', 'string', 'max:255'],
            'content' => ['required', 'string', 'max:65535'],
            'author' => ['nullable', 'string', 'max:255'],
            'status' => ['required', 'integer'],
            'sort' => ['integer'],
            'created_at' => ['date'],
            'updated_at' => ['date'],
            'deleted_at' => ['date'],
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
            'id' => 'ID',
            'category_id' => '分类',
            'title' => '标题',
            'cover_img' => '封面图',
            'content' => '内容',
            'author' => '作者',
            'status' => '状态',
            'sort' => '排序',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
            'deleted_at' => '删除时间',
            'meta_keywords' => 'meta',
            'meta_description' => 'meta',
            'origin' => '内容来源',
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

    public function category()
    {
        return $this->belongsTo(Product\Category::class, 'category_id');
    }

    public function getAuthorAttribute($value)
    {
        if (!$value)
        {
            return config('app.name');
        }
        return $value;
    }

    public function getBriefAttribute()
    {
        $value = $this->getAttribute('content');
        $value = strip_tags($value);
        $value = mb_substr($value, 0, 100);
        return $value;
    }

}
