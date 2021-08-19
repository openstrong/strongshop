<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;
use Illuminate\Support\Facades\DB;

/**
 * 验证的字段必须不存在于给定的数据库表中。
 */
class NotExists implements Rule
{

    public $model;
    public $column;
    public $message;

    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct($model, $column, $message = '')
    {
        $this->model = $model;
        $this->column = $column;
        $this->message = $message;
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        if (!is_array($value))
        {
            $value = [$value];
        }
        if (!class_exists($this->model))
        {
            $exists = DB::table($this->model)->whereIn($this->column, $value)->exists();
        } else
        {
            $exists = $this->model::whereIn($this->column, $value)->exists();
        }
        if ($exists)
        {
            return false;
        }
        return true;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        if ($this->message)
        {
            return $this->message;
        }
        return '请先删除关联的数据';
    }

}
