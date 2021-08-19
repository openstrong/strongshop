<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\Admin\Product;

use Illuminate\Http\Request;
use App\Http\Controllers\Admin\BaseController;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use App\Models\Product\Category;
use App\Rules\NotExists;

class CategoryController extends BaseController
{

    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, Category $category)
    {
        $model = Category::orderBy('sort', 'DESC');
        $model->where('type', 1);
        $model->where('level', 1);
        $model->with(['children' => function($query) {
                $query->with('children');
            },]);
        $model->with('parent');
        $rows = $model->get();
        return $this->view('category.index', ['rows' => $rows]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required', 'integer', Rule::exists('category')],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = Category::find($request->id);
        if ($model)
        {
            return ['code' => 200, 'message' => __('admin.Success'), 'data' => $model];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Store a newly created resource in storage.
     * 
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, Category $category)
    {
        if (!$request->expectsJson())
        {
            $category->parent_id = $request->parent_id ?: 0;
            $category->level = $request->level ?: 1;
            $category->status = 1;
            $category->sort = 200;
            return $this->view('category.form', ['model' => $category]);
        }
        $rules = array_merge_recursive($category->rules(), [
        ]);
        $messages = $category->messages();
        $customAttributes = $category->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $category->fill($request->all());
        $category->type = 1;
        if ($category->save())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessCreated'),
                'data' => $category,
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessCreated'), $category->tableComments, $category->id)
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Category $category)
    {
        if (!$request->expectsJson())
        {
            $model = $category::with('parent')->find($request->id);
            $menus = Category::where('parent_id', $model->parent['parent_id'])->orderByDesc('sort')->get();
            return $this->view('category.form', ['model' => $model, 'menus' => $menus]);
        }
        $rules = array_merge_recursive($category->rules(), [
            'id' => ['required', 'integer', Rule::exists('category')],
        ]);
        $messages = $category->messages();
        $customAttributes = $category->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = $category::find($request->id);
        $model->fill($request->all());
        if ($model->save())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessUpdated'),
                'data' => $model,
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessUpdated'), $category->tableComments, $model->id)
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, Category $category)
    {
        $validator = Validator::make($request->all(), [
                    'id' => [
                        'required',
                    //new NotExists('product_category', 'category_id')
                    ],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = is_array($request->id) ? $request->id : [$request->id];
        $model = $category::whereIn('id', $ids);
        if ($model->delete())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessDestroyed'),
                'log' => sprintf('[%s][%s]『id:%s』', __('admin.SuccessDestroyed'), $category->tableComments, json_encode($ids))
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

}
