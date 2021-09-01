<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\Product;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product\Product;
use Illuminate\Support\Facades\Cookie;
use App\Repositories\ProductRepository;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\View;
use App\Models\Product\Category;
use App\Models\Article;

class ProductController extends Controller
{

    /**
     * 产品 列表/搜索
     * @param Request $request
     * @return type
     */
    public function index(Request $request, $catid = null)
    {
        $model = Product::query();
        $model->where('status', 1)->where('hidden', 2);
        if ($request->sortBy == 1)
        {
            $model->orderBy('sale_price');
        } elseif ($request->sortBy == 2)
        {
            $model->orderByDesc('sale_price');
        } elseif ($request->sortBy == 3)
        {
            $model->orderByDesc('click_num');
        } elseif ($request->sortBy == 4)
        {
            $model->orderByDesc('sale_num');
        } else
        {
            if (!$request->keywords)
            {
                $model->orderBy('is_recommend');
            }
        }
        if ($request->catid)
        {
            $model->whereHas('categories', function($query)use($request) {
                $query->where('category_id', $request->catid);
            });
        }
        if ($request->is_new)
        {
            $model->where('is_new', $request->is_new);
        }
        if ($request->is_hot)
        {
            $model->where('is_hot', $request->is_hot);
        }
        if ($request->is_recommend)
        {
            $model->where('is_recommend', $request->is_recommend);
        }
        if ($request->input('price.min') !== null)
        {
            $model->where('sale_price', '>=', $request->input('price.min'));
        }
        if ($request->input('price.max') !== null)
        {
            $model->where('sale_price', '<=', $request->input('price.max'));
        }
        if ($request->stock)
        {
            $model->where('stock_status', $request->stock);
        }
        if ($request->keywords)
        {
            //先查询spu sku是否存在，如果不存在则进行全文检索查询
            $modelSku = clone $model;
            $modelSku->where(function($query)use($request) {
                $query->orWhere('spu', $request->keywords);
                $query->orWhere('sku', $request->keywords);
            });
            if ($modelSku->exists())
            {
                $model = $modelSku;
            } else
            {
                $keywords = preg_replace('/\W/i', ' ', $request->keywords); //去除非字母、数字、下划线的字符
                $model->whereRaw('MATCH(`title`) AGAINST (? IN BOOLEAN MODE)', ['> ' . $keywords]); //全文检索-布尔检索： IN BOOLEAN MODE
                /*                 * **********************************************************************************
                  ● 搜索语法规则：
                  +   一定要有(不含有该关键词的数据条均被忽略)。
                  -   不可以有(排除指定关键词，含有该关键词的均被忽略)。
                  >   提高该条匹配数据的权重值。
                  <   降低该条匹配数据的权重值。
                  ~   将其相关性由正转负，表示拥有该字会降低相关性(但不像 - 将之排除)，只是排在较后面权重值降低。
                 *   万用字，不像其他语法放在前面，这个要接在字符串后面。 
                  " " 用双引号将一段句子包起来表示要完全相符，不可拆字。
                 */
            }
        }
        $model->select(['id', 'title', 'stock', 'stock_status', 'original_price', 'sale_price', 'img_cover', 'click_num']);
        $rows = $model->paginate(12)->appends($request->all());
        if ($this->isApi)
        {
            return ['code' => 200, 'message' => 'Success', 'data' => $rows];
        }
        $filterPrices = ProductRepository::getFilterPrices(0, 5);
        if ($request->catid)
        {
            $category = Category::find($request->catid);
            if ($category)
            {
                View::share('_title', $category->name);
                View::share('_meta_keywords', $category->meta_keywords);
                View::share('_meta_description', $category->meta_description);
            }
        }
        return view('product.index', ['rows' => $rows, 'filterPrices' => $filterPrices]);
    }

    /**
     * 搜索
     * 【配合 elasticsearch 使用】
     * 使用此方法前确保模型 `App\Models\Product\Product` 使用 Trait `use \Laravel\Scout\Searchable;`
     * @param Request $request
     * @return type
     */
    public function search(Request $request)
    {
        $query = Product::search($request->keywords);
        $query->where('status', 1);
        $rows = $query->paginate();
        if ($this->isApi)
        {
            return ['code' => 200, 'message' => 'Success', 'data' => $rows];
        }
        return view('product.index', ['rows' => $rows, 'filterPrices' => []]);
    }

    public function show(Request $request, $id = null)
    {
        $model = Product::query();
        $model->with(['specs' => function($query) {
                $query->select('id', 'name', 'is_show_img', 'select_values');
                $query->where('product_spec.spec_type', 1);
            }]);
        $model->select('*');
        $model->addSelect('img_photos as asset_img_photos');
        $row = $model->find($request->id);
        if (!$row)
        {
            return $this->isWeb ? abort(404) : $this->renderError(3001, __('Ther product not exists'));
        }
        if ($row->status == 2)
        {
            return $this->renderError(3002, __('The product has been removed'));
        }
        //累加查看次数
        $click_num_key = 'click_num_' . $request->id;
        if (!$request->cookie($click_num_key))
        {
            $row->click_num += 1;
            $row->save();
            Cookie::queue($click_num_key, 1);
        }
        //spu产品
        if ($row->spu)
        {
            $productsModel = Product::query();
            $productsModel->where('spu', $row->spu);
            $productsModel->with(['specs' => function($query) {
                    $query->select('id', 'name');
                    $query->where('product_spec.spec_type', 1);
                }]);
            $productsModel->select('id', 'spu', 'sku', 'img_cover', 'img_spec');
            $spuProducts = $productsModel->get();
        } else
        {
            $spuProducts = [];
        }
        //** begin 处理spu规格
        $spu_specs = []; //相同 spu 的产品规格
        $specs_exists_all = []; //相同 spu 有效的全部规格
        foreach ($spuProducts as $spuProduct)
        {
            if (empty($spuProduct['specs']))
            {
                continue;
            }
            $spu_specs[] = [
                'product_id' => $spuProduct['id'],
                'sku' => $spuProduct['sku'],
                'spec_values' => collect($spuProduct['specs'])->pluck('pivot.spec_value')->sort()->values()
            ];
            //把产品图片追加到该产品规格里
            $spuProduct['specs']->map(function($item)use($spuProduct) {
                $item->product_img = $spuProduct->img_spec ?: $spuProduct->img_cover;
                return $item;
            });
            $specs_exists_all = array_merge($specs_exists_all, $spuProduct['specs']->toArray());
        }
        $group_spec = collect($specs_exists_all)->groupBy('id'); //按照规格id分组
        foreach ($row->specs as $spec)
        {
            $group_spec_vals = $group_spec->get($spec['id']);
            $new_group_spec = [];
            $select_values_arr = explode("\n", $spec['select_values']);
            //按照已设定的规格值顺序排序
            foreach ($select_values_arr as $select_value)
            {
                $res = $group_spec_vals->where('pivot.spec_value', $select_value);
                if ($res->isNotEmpty())
                {
                    $new_group_spec[] = $res->pop();
                }
            }
            $spec['spu_specs'] = $new_group_spec;
        }
        $row->spu_specs = $spu_specs;
        //** end 处理spu规格
        //收藏状态
        $row->is_collected = !$this->user ? 0 : (int) DB::table('user_collect')->where('product_id', $row->id)->where('user_id', $this->user->id)->exists();
        //相关配件，附件
        if ($row->related_accessories_sku)
        {
            $row->related_accessories_sku = Product::select('id', 'sku', 'title', 'sale_price', 'img_cover', 'wholesale_set')->whereIn('sku', explode(',', $row->related_accessories_sku))->get();
        }

        if ($this->isApi)
        {
            $row->makeHidden(['created_at', 'updated_at', 'deleted_at']);
            return ['code' => 200, 'message' => 'Success', 'data' => $row];
        }

        View::share('_title', $row->title);
        View::share('_meta_keywords', $row->meta_keywords);
        View::share('_meta_description', $row->meta_description);

        $returns = Article::find(37); //退货政策
        $delivery = Article::find(40); //发货政策
        return view('product.show', ['row' => $row, 'returns' => $returns, 'delivery' => $delivery]);
    }

    public function collect(Request $request)
    {
        $rules = [
            'product_id' => ['required', 'integer', Rule::exists('product', 'id')->where('status', 1)->whereNull('deleted_at')],
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $exists = DB::table('user_collect')->where('user_id', $this->user->id)->where('product_id', $request->product_id)->exists();
        if ($exists)
        {
            return ['code' => 200, 'message' => __('Success'), 'data' => [
                    'total' => null
            ]];
        }
        $res = DB::table('user_collect')->insert(['user_id' => $this->user->id, 'product_id' => $request->product_id, 'created_at' => now()]);
        if ($res)
        {
            $total = DB::table('user_collect')->where('user_id', $this->user->id)->count();
            return ['code' => 200, 'message' => __('Success'), 'data' => [
                    'total' => $total
                ]
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('Server internal error')];
        }
    }

}
