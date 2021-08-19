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
use App\Models\Product\SpecGroup;
use App\Models\Product\Spec;
use App\Rules\NotExists;

class SpecGroupController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product\SpecGroup  $specGroup
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, SpecGroup $specGroup)
    {
        if (!$request->expectsJson())
        {
            return $this->view('product.specGroup.index', ['model' => $specGroup]);
        }
        $model = SpecGroup::orderBy(($request->field ?: 'id'), ($request->order ?: 'desc'));
        if ($request->id) {
            $model->where('id', $request->id);
        }
        if ($request->name) {
            $model->where('name', 'like', "%{$request->name}%");
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
            'id' => ['required', 'integer', Rule::exists('spec_group')],
        ]);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = SpecGroup::find($request->id);
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
     * @param  \App\Models\Product\SpecGroup  $specGroup
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, SpecGroup $specGroup)
    {
        if (!$request->expectsJson())
        {
            return $this->view('product.specGroup.form', ['model' => $specGroup]);
        }
        $rules = array_merge_recursive($specGroup->rules(), [
            'name' => ['unique:spec_group'],
        ]);
        $messages = $specGroup->messages();
        $customAttributes = $specGroup->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $specGroup->fill($request->all());
        if($specGroup->save())
        {
            return [
                'code' => 200, 
                'message' => __('admin.SuccessCreated'), 
                'data' => $specGroup, 
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessCreated'), $specGroup->tableComments, $specGroup->id)
            ];
        }else{
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product\SpecGroup  $specGroup
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, SpecGroup $specGroup)
    {
        if (!$request->expectsJson())
        {
            $model = $specGroup::find($request->id);
            return $this->view('product.specGroup.form', ['model' => $model]);
        }
        $rules = array_merge_recursive($specGroup->rules(), [
            'id' => ['required', 'integer', Rule::exists('spec_group')],
            'name' => [Rule::unique('spec_group')->ignore($request->id)],
        ]);
        $messages = $specGroup->messages();
        $customAttributes = $specGroup->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = $specGroup::find($request->id);
        $model->fill($request->all());
        if($model->save())
        {
            return [
                'code' => 200, 
                'message' => __('admin.SuccessUpdated'), 
                'data' => $model, 
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessUpdated'), $specGroup->tableComments, $model->id)
            ];
        }else{
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product\SpecGroup  $specGroup
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, SpecGroup $specGroup)
    {
        $validator = Validator::make($request->all(), [
            'id' => ['required', new NotExists(Spec::class, 'spec_group_id')],
        ]);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = is_array($request->id) ? $request->id : [$request->id];
        $model = $specGroup::whereIn('id', $ids);
        if($model->delete()){
            return [
                'code' => 200, 
                'message' => __('admin.SuccessDestroyed'), 
                'log' => sprintf('[%s][%s]『id:%s』', __('admin.SuccessDestroyed'), $specGroup->tableComments, json_encode($ids))
            ];
        }else{
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }
}
