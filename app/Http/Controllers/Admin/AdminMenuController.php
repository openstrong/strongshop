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

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Carbon;
use App\Models\Admin\AdminMenu;

class AdminMenuController extends BaseController
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $model = AdminMenu::orderBy('sort', 'DESC');
        $model->where('level', 1);
        $model->with(['children' => function($query) {
                $query->with('children');
            },]);
        $model->with('parent');
        $rows = $model->get();
        return $this->view('adminMenu.index', ['rows' => $rows]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, AdminMenu $adminMenu)
    {
        if ($request->isMethod('get'))
        {
            $adminMenu->parent_id = $request->parent_id ?: 0;
            $adminMenu->level = $request->level ?: 1;
            $adminMenu->status = 1;
            $adminMenu->sort = 200;
            return $this->view('adminMenu.form', ['model' => $adminMenu]);
        }
        $rules = array_merge_recursive($adminMenu->rules(), [
            'route_url' => [Rule::unique('admin_menu')->where('level', $request->level ?: 1)],
        ]);
        $messages = $adminMenu->messages();
        $customAttributes = $adminMenu->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $adminMenu->fill($request->all());
        $adminMenu->route_url = trim($adminMenu->route_url, '/') ?: null;
        if ($adminMenu->save())
        {
            return ['code' => 200, 'message' => '添加成功', 'data' => $adminMenu, 'log' => sprintf('[%s][%s][id:%s]', $adminMenu->tableComments, '添加成功', $adminMenu->id)];
        } else
        {
            return ['code' => 5001, 'message' => __('common.Server internal error')];
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Admin\AdminMenu  $adminMenu
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AdminMenu $adminMenu)
    {
        if ($request->isMethod('get'))
        {
            $adminMenu = $adminMenu::find($request->id);
            $menus = AdminMenu::where('level', 1)->orderByDesc('sort')->get();
            return $this->view('adminMenu.form', ['model' => $adminMenu, 'menus' => $menus]);
        }
        $rules = array_merge_recursive($adminMenu->rules(), [
            'id' => ['required', 'integer', Rule::exists('admin_menu')],
            'route_url' => [Rule::unique('admin_menu')->where('level', $request->level)->ignore($request->id)],
        ]);
        $messages = $adminMenu->messages();
        $customAttributes = $adminMenu->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = $adminMenu::find($request->id);
        $model->fill($request->all());
        $model->route_url = trim($model->route_url, '/') ?: null;
        if ($model->save())
        {
            return ['code' => 200, 'message' => '更新成功', 'data' => $model, 'log' => sprintf('[%s][%s][id:%s]', $adminMenu->tableComments, '更新成功', $model->id)];
        } else
        {
            return ['code' => 5001, 'message' => __('common.Server internal error')];
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Admin\AdminMenu  $adminMenu
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, AdminMenu $adminMenu)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required', new \App\Rules\NotExists(AdminMenu::class, 'parent_id', '请先删除下级关联数据')],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = is_array($request->id) ? $request->id : [$request->id];
        $model = AdminMenu::whereIn('id', $ids);
        if ($model->delete())
        {
            return ['code' => 200, 'message' => '删除成功', 'log' => sprintf('[%s][%s]『id:%s』', $adminMenu->tableComments, __('admin.SuccessDestroyed'), json_encode($ids))];
        } else
        {
            return ['code' => 5001, 'message' => __('common.Server internal error')];
        }
    }

}
