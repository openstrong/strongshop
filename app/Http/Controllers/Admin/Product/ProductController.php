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
use Illuminate\Support\Carbon;
use App\Models\Product\Product;
use App\Repositories\Admin\ProductRepositories;
use Illuminate\Support\Facades\DB;
use App\Models\Product\SpecGroup;
use App\Models\Product\Spec;
use App\Models\Product\Brand;
use App\Models\Product\Category;

class ProductController extends BaseController
{

    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, Product $product)
    {
        if (!$request->expectsJson())
        {
            $model = Category::query();
            $model->orderBy('sort', 'DESC');
            $model->where('type', 1)->where('level', 1);
            $model->with(['children' => function($query) {
                    $query->orderBy('sort', 'DESC');
                    $query->select('id', 'parent_id', 'name');
                    $query->with(['children' => function($query) {
                            $query->orderBy('sort', 'DESC');
                            $query->select('id', 'parent_id', 'name');
                        }]);
                }]);
            $categories = $model->select('id', 'name')->get();

            return $this->view('product.index', ['model' => $product, 'categories' => $categories]);
        }
        $model = Product::orderBy(($request->field ?: 'id'), ($request->order ?: 'desc'));
        if ($request->category_id)
        {
            $model->whereHas('categories', function($query)use($request) {
                $query->where('category_id', $request->category_id);
            });
        }
        if ($request->title)
        {
            $model->where('title', 'like', "%{$request->title}%");
        }
        if ($request->intro)
        {
            $model->where('intro', 'like', "%{$request->intro}%");
        }
        if ($request->spu)
        {
            $model->where('spu', $request->spu);
        }
        if ($request->sku)
        {
            $model->where('sku', $request->sku);
        }
        if ($request->stock)
        {
            $model->where('stock', $request->stock);
        }
        if ($request->stock_status)
        {
            $model->where('stock_status', $request->stock_status);
        }
        if ($request->original_price)
        {
            $model->where('original_price', $request->original_price);
        }
        if ($request->sale_price)
        {
            $model->where('sale_price', $request->sale_price);
        }
        if ($request->long)
        {
            $model->where('long', $request->long);
        }
        if ($request->width)
        {
            $model->where('width', $request->width);
        }
        if ($request->high)
        {
            $model->where('high', $request->high);
        }
        if ($request->weight)
        {
            $model->where('weight', $request->weight);
        }
        if ($request->volume_weight)
        {
            $model->where('volume_weight', $request->volume_weight);
        }
        if ($request->click_num)
        {
            $model->where('click_num', $request->click_num);
        }
        if ($request->status)
        {
            $model->where('status', $request->status);
        }
        if ($request->remark)
        {
            $model->where('remark', 'like', "%{$request->remark}%");
        }
        if ($request->created_at_begin && $request->created_at_end)
        {
            $model->whereBetween('created_at', [$request->created_at_begin, Carbon::parse($request->created_at_end)->endOfDay()]);
        }
        if ($request->brand_id)
        {
            $model->where('brand_id', $request->brand_id);
        }
        if ((isset($request->page) && $request->page <= 0) || $request->export)
        {
            $rows = $model->get();
        } else
        {
            $rows = $model->paginate($request->limit);
        }
        //$rows->makeHidden(['deleted_at']);
        return ['code' => 200, 'message' => __('admin.Success'), 'data' => $rows];
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
                    'id' => ['required', 'integer', Rule::exists('product')],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = Product::find($request->id);
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
     * @param  \App\Models\Product\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, Product $product)
    {
        if (!$request->expectsJson())
        {
            $categories = ProductRepositories::categoryTree(); //分类
            //规格
            $specGroups = SpecGroup::query()->get();
            $specs = [];
            $brands = Brand::query()->get(); //品牌
            $product->status = 1;
            $product->hidden = 2;
            return $this->view('product.form', ['model' => $product, 'categories' => $categories, 'specGroups' => $specGroups, 'specs' => $specs, 'brands' => $brands]);
        }
        $data = $request->all();
        $rules = array_merge_recursive($product->rules(), [
            'sku' => ['unique:product'],
        ]);
        $validator = Validator::make($data, $rules, $product->messages(), $product->customAttributes());
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        // 同属于一个 spu 的 产品(sku)，价格规格不能重复
        $exists_spec_sku = ProductRepositories::checkUniqueSpec($request->productSpecs, $request->spu);
        if ($exists_spec_sku !== false)
        {
            return ['code' => 4001, 'message' => "规格重复，同属于spu({$request->spu})的产品价格规格已存在，该产品 sku 为： {$exists_spec_sku}"];
        }

        $product->fill($data);
        DB::transaction(function() use($product, $request) {
            $productSpecs = ProductRepositories::pluckSpecs($request->productSpecs); //处理前端提交的产品规格
            $categories = ProductRepositories::pluckCategoryId($request->categories); //处理前端提交的分类树数据
            //产品保存
            $product->save();

            /*
             * 模型同步关联 sync 
             * 使用方式参考：https://learnku.com/docs/laravel/6.x/eloquent-relationships/5177#3733b2
             */
            $product->categories()->sync($categories); //保存分类
            $product->specs()->sync($productSpecs); //保存规格
        });
        return [
            'code' => 200,
            'message' => __('admin.SuccessCreated'),
            'data' => $product,
            'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessCreated'), $product->tableComments, $product->id)
        ];
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        if (!$request->expectsJson())
        {
            $model = $product::find($request->id);
            $ids = $model->categories->pluck('id')->toArray();
            $categories = ProductRepositories::categoryTree($ids);
            $specGroups = SpecGroup::query()->get(); //规格组列表
            $brands = Brand::query()->get(); //品牌
            return $this->view('product.form', ['model' => $model, 'categories' => $categories, 'specGroups' => $specGroups, 'brands' => $brands]);
        }
        if (!$request->is_hot)
        {
            $request->merge(['is_hot' => 2]);
        }
        if (!$request->is_new)
        {
            $request->merge(['is_new' => 2]);
        }
        if (!$request->is_recommend)
        {
            $request->merge(['is_recommend' => 2]);
        }
        $rules = array_merge_recursive($product->rules(), [
            'id' => ['required', 'integer', Rule::exists('product')],
            'sku' => [Rule::unique('product')->ignore($request->id)],
        ]);
        $messages = $product->messages();
        $customAttributes = $product->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        if ($request->productSpecs && $request->spu)
        {
            // 同属于一个 spu 的 产品(sku)，价格规格不能重复
            $exists_spec_sku = ProductRepositories::checkUniqueSpec($request->productSpecs, $request->spu, $request->id);
            if ($exists_spec_sku !== false)
            {
                return ['code' => 4001, 'message' => "规格重复，同属于spu({$request->spu})的产品价格规格已存在，该产品 sku 为： {$exists_spec_sku}"];
            }
        }
        $model = $product::find($request->id);
        $model->fill($request->all());
        $logDirty = $model->getDirty();
        $logOriginal = $model->getOriginal();
        DB::transaction(function() use($model, $request) {
            $productSpecs = ProductRepositories::pluckSpecs($request->productSpecs); //处理前端提交的产品规格
            $categories = ProductRepositories::pluckCategoryId($request->categories); //处理前端提交的分类树数据
            //产品保存
            $model->save();

            /*
             * 模型同步关联 sync 
             * 使用方式参考：https://learnku.com/docs/laravel/6.x/eloquent-relationships/5177#3733b2
             */
            $model->categories()->sync($categories); //保存分类
            $model->specs()->sync($productSpecs); //保存规格
        });
        return [
            'code' => 200,
            'message' => __('admin.SuccessUpdated'),
            'data' => $model,
            'log' => sprintf('[%s][%s][id:%s][sku:%s]', __('admin.SuccessUpdated'), $model->tableComments, $model->id, $model->sku),
            'logOriginal' => $logOriginal,
            'logDirty' => $logDirty
        ];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, Product $product)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required',],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = is_array($request->id) ? $request->id : [$request->id];
        $model = $product::whereIn('id', $ids);
        if ($model->delete())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessDestroyed'),
                'log' => sprintf('[%s][%s]『id:%s』', __('admin.SuccessDestroyed'), $product->tableComments, json_encode($ids))
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * 产品规格 html部分
     * @param Request $request
     * @return type
     */
    public function specHtmlString(Request $request)
    {
        $specs = [];
        $productSpecs = [];
        if ($request->specGroupId)
        {
            //已有的规格列表
            $specs = Spec::query()
                    ->orderBy('spec_type')
                    ->where('spec_group_id', $request->specGroupId)
                    ->select('*', 'select_values as select_values_array')
                    ->get();
        }
        if ($request->productId)
        {
            //已选的产品规格列表
            $model = Product::find($request->productId);
            $productSpecs = $model->specs()->pluck('spec_value', 'spec_id');
        }
        $contents = $this->view('product.spec', ['specs' => $specs, 'productSpecs' => $productSpecs])->render();
        return ['code' => 200, 'message' => __('admin.Success'), 'data' => $contents];
    }

    /**
     * 复制
     * @param Request $request
     * @param Product $product
     * @return type
     */
    public function copy(Request $request, Product $product)
    {
        $model = $product::find($request->id);
        $ids = $model->categories->pluck('id')->toArray();
        $categories = ProductRepositories::categoryTree($ids);
        $specGroups = SpecGroup::query()->get(); //规格组列表
        $brands = Brand::query()->get(); //品牌
        return $this->view('product.form', ['model' => $model, 'categories' => $categories, 'specGroups' => $specGroups, 'brands' => $brands, '_action' => route('product.create')]);
    }

}
