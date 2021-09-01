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
use App\Models\Admin\AdminUser;

class AdminUserController extends BaseController
{

    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Admin\AdminUser  $adminUser
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, AdminUser $adminUser)
    {
        if (!$request->expectsJson())
        {
            return $this->view('adminUser.index', ['model' => $adminUser]);
        }
        $model = AdminUser::orderBy(($request->field ?: 'id'), ($request->order ?: 'desc'));
        $model->with('roles:id,name');
        if ($request->id)
        {
            $model->where('id', $request->id);
        }
        if ($request->user_name)
        {
            $model->where('user_name', 'like', "%{$request->user_name}%");
        }
        if ($request->role_id)
        {
            $model->where('role_id', $request->role_id);
        }
        if ($request->name)
        {
            $model->where('name', 'like', "%{$request->name}%");
        }
        if ($request->email)
        {
            $model->where('email', 'like', "%{$request->email}%");
        }
        if ($request->phone)
        {
            $model->where('phone', 'like', "%{$request->phone}%");
        }
        if ($request->introduction)
        {
            $model->where('introduction', 'like', "%{$request->introduction}%");
        }
        if ($request->status)
        {
            $model->where('status', $request->status);
        }
        if ($request->last_ip)
        {
            $model->where('last_ip', 'like', "%{$request->last_ip}%");
        }
        if ($request->last_at)
        {
            $model->where('last_at', $request->last_at);
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
     * Display the specified resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required', 'integer', Rule::exists('admin_user')],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = AdminUser::find($request->id);
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
     * @param  \App\Models\Admin\AdminUser  $adminUser
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, AdminUser $adminUser)
    {
        if (!$request->expectsJson())
        {
            return $this->view('adminUser.form', ['model' => $adminUser]);
        }
        $rules = array_merge_recursive($adminUser->rules(), [
            'user_name' => ['unique:admin_user'],
            'password' => ['required'],
        ]);
        $messages = $adminUser->messages();
        $customAttributes = $adminUser->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        if ($request->password)
        {
            $request->merge(['password' => bcrypt($request->password)]);
        }
        $adminUser->fill($request->all());
        if ($adminUser->save() && $adminUser->roles()->sync($request->role_id))
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessCreated'),
                'data' => $adminUser,
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessCreated'), $adminUser->tableComments, $adminUser->id)
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
     * @param  \App\Models\Admin\AdminUser  $adminUser
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AdminUser $adminUser)
    {
        if (!$request->expectsJson())
        {
            $model = $adminUser::find($request->id);
            return $this->view('adminUser.form', ['model' => $model]);
        }
        $rules = array_merge_recursive($adminUser->rules(), [
            'id' => ['required', 'integer', Rule::exists('admin_user')],
            'user_name' => [Rule::unique('admin_user')->ignore($request->id)],
        ]);
        $messages = $adminUser->messages();
        $customAttributes = $adminUser->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        if ($request->password)
        {
            $request->merge(['password' => bcrypt($request->password)]);
        }
        $model = $adminUser::find($request->id);
        $model->fill($request->all());
        if ($model->save() && $model->roles()->sync($request->role_id))
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessUpdated'),
                'data' => $model,
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessUpdated'), $adminUser->tableComments, $model->id)
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
     * @param  \App\Models\Admin\AdminUser  $adminUser
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, AdminUser $adminUser)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required',],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = is_array($request->id) ? $request->id : [$request->id];
        $model = $adminUser::whereIn('id', $ids);
        if ($model->delete())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessDestroyed'),
                'log' => sprintf('[%s][%s]『id:%s』', __('admin.SuccessDestroyed'), $adminUser->tableComments, json_encode($ids))
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

}
