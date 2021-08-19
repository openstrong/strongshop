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

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Article;
use Illuminate\Support\Facades\View;
use App\Models\Product\Category;

class ArticleController extends Controller
{

    public function index(Request $request)
    {
        $model = Article::query();
        $model->where('status', 1);
        $model->whereHas('category', function($query) {
            $query->where('status', 1);
        });
        if ($request->catid)
        {
            $model->where('category_id', $request->catid);
        }
        $model->orderByDesc('id');
        $rows = $model->paginate(10);
        $cats = Category::query()->where('type', 2)->where('status', 1)->where('parent_id', 0)->get();
        if ($request->catid)
        {
            $category = Category::find($request->catid);
            View::share('_title', $category->name);
            View::share('_meta_keywords', $category->meta_keywords);
            View::share('_meta_description', $category->meta_description);
        }
        return view('article.index', ['rows' => $rows, 'cats' => $cats]);
    }

    public function show(Request $request, $id = null, $title = null)
    {
        $model = Article::query();
        $row = $model->find($request->id);
        if (!$row)
        {
            return $this->isWeb ? abort(404) : $this->renderError(3001, __('Ther product not exists'));
        }

        if ($this->isApi)
        {
            $row->makeHidden(['created_at', 'updated_at', 'deleted_at']);
            return ['code' => 200, 'message' => 'Success', 'data' => $row];
        }
        $cats = Category::query()->where('type', 2)->where('status', 1)->where('parent_id', 0)->get();

        View::share('_title', $row->title);
        View::share('_meta_keywords', $row->meta_keywords);
        View::share('_meta_description', $row->meta_description);
        return view('article.show', ['row' => $row, 'cats' => $cats]);
    }

}
