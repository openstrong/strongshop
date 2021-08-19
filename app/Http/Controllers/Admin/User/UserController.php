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

namespace App\Http\Controllers\Admin\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Admin\BaseController;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Carbon;
use App\Models\User;
use App\Repositories\RegionRepository;
use App\Models\User\UserPushNotification;

class UserController extends BaseController
{

    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, User $user)
    {
        if (!$request->expectsJson())
        {
            $countries = RegionRepository::countries();
            return $this->view('user.index', ['model' => $user, 'countries' => $countries]);
        }
        $model = User::orderBy(($request->field ?: 'id'), ($request->order ?: 'desc'));
        if ($request->id)
        {
            $model->where('id', $request->id);
        }
        if ($request->first_name)
        {
            $model->where('first_name', 'like', "%{$request->first_name}%");
        }
        if ($request->last_name)
        {
            $model->where('last_name', 'like', "%{$request->last_name}%");
        }
        if ($request->nickname)
        {
            $model->where('nickname', 'like', "%{$request->nickname}%");
        }
        if ($request->user_name)
        {
            $model->where('user_name', 'like', "%{$request->user_name}%");
        }
        if ($request->email)
        {
            $model->where('email', 'like', "%{$request->email}%");
        }
        if ($request->email_verified_at)
        {
            $model->where('email_verified_at', $request->email_verified_at);
        }
        if ($request->mobile)
        {
            $model->where('mobile', 'like', "%{$request->mobile}%");
        }
        if ($request->mobile_verified_at)
        {
            $model->where('mobile_verified_at', $request->mobile_verified_at);
        }
        if ($request->created_at_begin && $request->created_at_end)
        {
            $model->whereBetween('created_at', [$request->created_at_begin, Carbon::parse($request->created_at_end)->endOfDay()]);
        }
        if ($request->status)
        {
            $model->where('status', $request->status);
        }
        if ($request->last_login_at)
        {
            $model->where('last_login_at', $request->last_login_at);
        }
        if ($request->last_login_ip)
        {
            $model->where('last_login_ip', 'like', "%{$request->last_login_ip}%");
        }
        if ($request->gender !== null)
        {
            $model->where('gender', $request->gender);
        }
        if ($request->birthday)
        {
            $model->where('birthday', $request->birthday);
        }
        if ($request->country_code)
        {
            $model->where('country_code', $request->country_code);
        }
        if ($request->rank_credits_begin !== null && $request->rank_credits_end !== null)
        {
            $model->whereBetween('rank_credits', [$request->rank_credits_begin, $request->rank_credits_end]);
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
                    'id' => ['required', 'integer', Rule::exists('user')],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = User::find($request->id);
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
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, User $user)
    {
        if (!$request->expectsJson())
        {
            $user->gender = 0;
            return $this->view('user.form', ['model' => $user]);
        }
        $rules = array_merge_recursive($user->rules(), [
            'user_name' => ['unique:user'],
            'email' => ['unique:user'],
            'mobile' => ['unique:user'],
            'api_token' => ['unique:user'],
            'wechat_open_id' => ['unique:user'],
            'wechat_union_id' => ['unique:user'],
            'qq_open_id' => ['unique:user'],
            'facebook_open_id' => ['unique:user'],
            'google_open_id' => ['unique:user'],
            'password' => ['required'],
        ]);
        $messages = $user->messages();
        $customAttributes = $user->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $user->fill($request->all());
        $user->password = bcrypt($request->password);
        if ($user->save())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessCreated'),
                'data' => $user,
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessCreated'), $user->tableComments, $user->id)
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
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        if (!$request->expectsJson())
        {
            $model = $user::find($request->id);
            return $this->view('user.form', ['model' => $model]);
        }
        $rules = array_merge_recursive($user->rules(), [
            'id' => ['required', 'integer', Rule::exists('user')],
            'user_name' => [Rule::unique('user')->ignore($request->id)],
            'email' => [Rule::unique('user')->ignore($request->id)],
            'mobile' => [Rule::unique('user')->ignore($request->id)],
            'api_token' => [Rule::unique('user')->ignore($request->id)],
            'wechat_open_id' => [Rule::unique('user')->ignore($request->id)],
            'wechat_union_id' => [Rule::unique('user')->ignore($request->id)],
            'qq_open_id' => [Rule::unique('user')->ignore($request->id)],
            'facebook_open_id' => [Rule::unique('user')->ignore($request->id)],
            'google_open_id' => [Rule::unique('user')->ignore($request->id)],
        ]);
        $messages = $user->messages();
        $customAttributes = $user->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = $user::find($request->id);
        $model->fill($request->all());
        if ($request->password)
        {
            $model->password = bcrypt($request->password);
        }
        if ($model->save())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessUpdated'),
                'data' => $model,
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessUpdated'), $user->tableComments, $model->id)
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
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, User $user)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required',],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = is_array($request->id) ? $request->id : [$request->id];
        $model = $user::whereIn('id', $ids);
        if ($model->delete())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessDestroyed'),
                'log' => sprintf('[%s][%s]『id:%s』', __('admin.SuccessDestroyed'), $user->tableComments, json_encode($ids))
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

}
