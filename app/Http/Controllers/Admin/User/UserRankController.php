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
use App\Models\UserRank;

class UserRankController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\UserRank  $userRank
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, UserRank $userRank)
    {
        if (!$request->expectsJson())
        {
            return $this->view('user.userRank.index', ['model' => $userRank]);
        }
        $model = UserRank::orderBy(($request->field ?: 'id'), ($request->order ?: 'desc'));
        if ($request->id) {
            $model->where('id', $request->id);
        }
        if ($request->name) {
            $model->where('name', 'like', "%{$request->name}%");
        }
        if ($request->min_credits) {
            $model->where('min_credits', $request->min_credits);
        }
        if ($request->max_credits) {
            $model->where('max_credits', $request->max_credits);
        }
        if ($request->created_at_begin && $request->created_at_end) {
            $model->whereBetween('created_at', [$request->created_at_begin, Carbon::parse($request->created_at_end)->endOfDay()]);
        }
        if((isset($request->page) && $request->page <= 0) || $request->export){
            $rows = $model->get();
        }else{
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
            'id' => ['required', 'integer', Rule::exists('user_rank')],
        ]);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = UserRank::find($request->id);
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
     * @param  \App\Models\UserRank  $userRank
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, UserRank $userRank)
    {
        if (!$request->expectsJson())
        {
            return $this->view('user.userRank.form', ['model' => $userRank]);
        }
        $rules = array_merge_recursive($userRank->rules(), [
        ]);
        $messages = $userRank->messages();
        $customAttributes = $userRank->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $userRank->fill($request->all());
        if($userRank->save())
        {
            return [
                'code' => 200, 
                'message' => __('admin.SuccessCreated'), 
                'data' => $userRank, 
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessCreated'), $userRank->tableComments, $userRank->id)
            ];
        }else{
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\UserRank  $userRank
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, UserRank $userRank)
    {
        if (!$request->expectsJson())
        {
            $model = $userRank::find($request->id);
            return $this->view('user.userRank.form', ['model' => $model]);
        }
        $rules = array_merge_recursive($userRank->rules(), [
            'id' => ['required', 'integer', Rule::exists('user_rank')],
        ]);
        $messages = $userRank->messages();
        $customAttributes = $userRank->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = $userRank::find($request->id);
        $model->fill($request->all());
        if($model->save())
        {
            return [
                'code' => 200, 
                'message' => __('admin.SuccessUpdated'), 
                'data' => $model, 
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessUpdated'), $userRank->tableComments, $model->id)
            ];
        }else{
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\UserRank  $userRank
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, UserRank $userRank)
    {
        $validator = Validator::make($request->all(), [
            'id' => ['required',],
        ]);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = is_array($request->id) ? $request->id : [$request->id];
        $model = $userRank::whereIn('id', $ids);
        if($model->delete()){
            return [
                'code' => 200, 
                'message' => __('admin.SuccessDestroyed'), 
                'log' => sprintf('[%s][%s]『id:%s』', __('admin.SuccessDestroyed'), $userRank->tableComments, json_encode($ids))
            ];
        }else{
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }
}
