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
use App\Models\Product\Brand;

class BrandController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product\Brand  $brand
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, Brand $brand)
    {
        if (!$request->expectsJson())
        {
            return $this->view('brand.index', ['model' => $brand]);
        }
        $model = Brand::orderBy(($request->field ?: 'id'), ($request->order ?: 'desc'));
        if ($request->id) {
            $model->where('id', $request->id);
        }
        if ($request->title) {
            $model->where('title', 'like', "%{$request->title}%");
        }
        if ($request->logo) {
            $model->where('logo', 'like', "%{$request->logo}%");
        }
        if ($request->more) {
            $model->where('more', 'like', "%{$request->more}%");
        }
        if ($request->status) {
            $model->where('status', $request->status);
        }
        if ($request->sort) {
            $model->where('sort', $request->sort);
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
            'id' => ['required', 'integer', Rule::exists('brand')],
        ]);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = Brand::find($request->id);
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
     * @param  \App\Models\Product\Brand  $brand
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, Brand $brand)
    {
        if (!$request->expectsJson())
        {
            $brand->sort = 200;
            return $this->view('brand.form', ['model' => $brand]);
        }
        $rules = array_merge_recursive($brand->rules(), [
            'title' => ['unique:brand'],
        ]);
        $messages = $brand->messages();
        $customAttributes = $brand->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $brand->fill($request->all());
        if($brand->save())
        {
            return [
                'code' => 200, 
                'message' => __('admin.SuccessCreated'), 
                'data' => $brand, 
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessCreated'), $brand->tableComments, $brand->id)
            ];
        }else{
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product\Brand  $brand
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Brand $brand)
    {
        if (!$request->expectsJson())
        {
            $model = $brand::find($request->id);
            return $this->view('brand.form', ['model' => $model]);
        }
        $rules = array_merge_recursive($brand->rules(), [
            'id' => ['required', 'integer', Rule::exists('brand')],
            'title' => [Rule::unique('brand')->ignore($request->id)],
        ]);
        $messages = $brand->messages();
        $customAttributes = $brand->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = $brand::find($request->id);
        $model->fill($request->all());
        if($model->save())
        {
            return [
                'code' => 200, 
                'message' => __('admin.SuccessUpdated'), 
                'data' => $model, 
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessUpdated'), $brand->tableComments, $model->id)
            ];
        }else{
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product\Brand  $brand
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, Brand $brand)
    {
        $validator = Validator::make($request->all(), [
            'id' => ['required',],
        ]);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = is_array($request->id) ? $request->id : [$request->id];
        $model = $brand::whereIn('id', $ids);
        if($model->delete()){
            return [
                'code' => 200, 
                'message' => __('admin.SuccessDestroyed'), 
                'log' => sprintf('[%s][%s]『id:%s』', __('admin.SuccessDestroyed'), $brand->tableComments, json_encode($ids))
            ];
        }else{
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }
}
