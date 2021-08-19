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
use App\Http\Controllers\Admin\BaseController;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Carbon;
use App\Models\Admin\AdminLog;

class AdminLogController extends BaseController
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, AdminLog $adminLog)
    {
        if (!$request->ajax() && !$request->pjax())
        {
            return $this->view('adminLog.index', ['model' => $adminLog]);
        }
        $model = AdminLog::orderBy(($request->field ?: 'id'), ($request->order ?: 'desc'));
        $model->with('adminUser:id,user_name,name');
        if ($request->id)
        {
            $model->where('id', $request->id);
        }
        if ($request->route_url)
        {
            $model->where('route_url', 'like', "%{$request->route_url}%");
        }
        if ($request->desc)
        {
            $model->where('desc', 'like', "%{$request->desc}%");
        }
        if ($request->admin_user_id)
        {
            $model->whereHas('adminUser', function($query)use($request) {
                $query->where('user_name', 'like', "%{$request->admin_user_id}%");
            });
        }
        if ($request->created_at_begin && $request->created_at_end)
        {
            $model->whereBetween('created_at', [$request->created_at_begin, Carbon::parse($request->created_at_end)->endOfDay()]);
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
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Admin\AdminLog  $adminLog
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, AdminLog $adminLog)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required',],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = is_array($request->id) ? $request->id : [$request->id];
        $model = $adminLog::whereIn('id', $ids);
        if ($model->delete())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessDestroyed'),
                'log' => sprintf('[%s][%s]『id:%s』', __('admin.SuccessDestroyed'), $adminLog->tableComments, json_encode($ids))
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

}
