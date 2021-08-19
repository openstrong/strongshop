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
use App\Models\User\UserPushNotification;

class UserPushNotificationController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User\UserPushNotification  $userPushNotification
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, UserPushNotification $userPushNotification)
    {
        if (!$request->expectsJson())
        {
            return $this->view('user.userPushNotification.index', ['model' => $userPushNotification]);
        }
        $model = UserPushNotification::orderBy(($request->field ?: 'id'), ($request->order ?: 'desc'));
        $model->with('adminUser:id,name');
        if ($request->id) {
            $model->where('id', $request->id);
        }
        if ($request->type) {
            $model->where('type', $request->type);
        }
        if ($request->title) {
            $model->where('title', 'like', "%{$request->title}%");
        }
        if ($request->content) {
            $model->where('content', 'like', "%{$request->content}%");
        }
        if ($request->admin_id) {
            $model->where('admin_id', $request->admin_id);
        }
        if ($request->send_at) {
            $model->where('send_at', $request->send_at);
        }
        if ($request->status) {
            $model->where('status', $request->status);
        }
        if ($request->created_at_begin && $request->created_at_end) {
            $model->whereBetween('created_at', [$request->created_at_begin, Carbon::parse($request->created_at_end)->endOfDay()]);
        }
        if((isset($request->page) && $request->page <= 0) || $request->export){
            $rows = $model->get();
        }else{
            $rows = $model->paginate($request->limit);
        }
        $rows->makeHidden(['deleted_at', 'content']);
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
            'id' => ['required', 'integer', Rule::exists('user_push_notification')],
        ]);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = UserPushNotification::find($request->id);
        if($model){
            return ['code' => 200, 'message' => __('admin.Success'), 'data' => $model];
        }else{
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }
    
    /**
     * Store a newly created resource in storage.
     * 
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User\UserPushNotification  $userPushNotification
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, UserPushNotification $userPushNotification)
    {
        $validator = Validator::make($request->all(),
                        [
                            'batchSendMail.title' => ['required', 'string', 'min:1'],
                            'batchSendMail.content' => ['required', 'string', 'min:1'],
                            'batchSendMail.sendtime' => ['required', 'date', 'after:now'],
                        ],
                        [],
                        [
                            'batchSendMail.title' => '邮件标题',
                            'batchSendMail.content' => '邮件内容',
                            'batchSendMail.sendtime' => '发送时间',
                        ]
        );
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $userPushNotification->type = 1;
        $userPushNotification->admin_id = auth('admin')->id();
        $userPushNotification->title = $request->input('batchSendMail.title');
        $userPushNotification->content = $request->input('batchSendMail.content');
        $userPushNotification->send_at = $request->input('batchSendMail.sendtime');
        if ($userPushNotification->save())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessCreated'),
                'data' => $userPushNotification,
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessCreated'), $userPushNotification->tableComments, $userPushNotification->id)
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
     * @param  \App\Models\User\UserPushNotification  $userPushNotification
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, UserPushNotification $userPushNotification)
    {
        if (!$request->expectsJson())
        {
            $model = $userPushNotification::find($request->id);
            return $this->view('user.userPushNotification.form', ['model' => $model]);
        }
        $rules = array_merge_recursive($userPushNotification->rules(), [
            'id' => ['required', 'integer', Rule::exists('user_push_notification')],
        ]);
        $messages = $userPushNotification->messages();
        $customAttributes = $userPushNotification->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = $userPushNotification::find($request->id);
        $model->fill($request->all());
        if($model->save())
        {
            return [
                'code' => 200, 
                'message' => __('admin.SuccessUpdated'), 
                'data' => $model, 
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessUpdated'), $userPushNotification->tableComments, $model->id)
            ];
        }else{
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User\UserPushNotification  $userPushNotification
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, UserPushNotification $userPushNotification)
    {
        $validator = Validator::make($request->all(), [
            'id' => ['required',],
        ]);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = is_array($request->id) ? $request->id : [$request->id];
        $model = $userPushNotification::whereIn('id', $ids);
        if($model->delete()){
            return [
                'code' => 200, 
                'message' => __('admin.SuccessDestroyed'), 
                'log' => sprintf('[%s][%s]『id:%s』', __('admin.SuccessDestroyed'), $userPushNotification->tableComments, json_encode($ids))
            ];
        }else{
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }
}
