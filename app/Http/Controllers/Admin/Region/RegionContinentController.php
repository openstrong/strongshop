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

namespace App\Http\Controllers\Admin\Region;

use Illuminate\Http\Request;
use App\Http\Controllers\Admin\BaseController;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Carbon;
use App\Models\Region\RegionContinent;

class RegionContinentController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Region\RegionContinent  $regionContinent
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, RegionContinent $regionContinent)
    {
        if (!$request->expectsJson())
        {
            return $this->view('region.regionContinent.index', ['model' => $regionContinent]);
        }
        $model = RegionContinent::orderBy(($request->field ?: 'id'), ($request->order ?: 'desc'));
        if ($request->id) {
            $model->where('id', $request->id);
        }
        if ($request->iso2) {
            $model->where('iso2', 'like', "%{$request->iso2}%");
        }
        if ($request->cn_name) {
            $model->where('cn_name', 'like', "%{$request->cn_name}%");
        }
        if ($request->en_name) {
            $model->where('en_name', 'like', "%{$request->en_name}%");
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
            'id' => ['required', 'integer', Rule::exists('region_continent')],
        ]);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = RegionContinent::find($request->id);
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
     * @param  \App\Models\Region\RegionContinent  $regionContinent
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, RegionContinent $regionContinent)
    {
        if (!$request->expectsJson())
        {
            return $this->view('region.regionContinent.form', ['model' => $regionContinent]);
        }
        $rules = array_merge_recursive($regionContinent->rules(), [
        ]);
        $messages = $regionContinent->messages();
        $customAttributes = $regionContinent->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $regionContinent->fill($request->all());
        if($regionContinent->save())
        {
            return [
                'code' => 200, 
                'message' => __('admin.SuccessCreated'), 
                'data' => $regionContinent, 
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessCreated'), $regionContinent->tableComments, $regionContinent->id)
            ];
        }else{
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Region\RegionContinent  $regionContinent
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, RegionContinent $regionContinent)
    {
        if (!$request->expectsJson())
        {
            $model = $regionContinent::find($request->id);
            return $this->view('region.regionContinent.form', ['model' => $model]);
        }
        $rules = array_merge_recursive($regionContinent->rules(), [
            'id' => ['required', 'integer', Rule::exists('region_continent')],
        ]);
        $messages = $regionContinent->messages();
        $customAttributes = $regionContinent->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = $regionContinent::find($request->id);
        $model->fill($request->all());
        if($model->save())
        {
            return [
                'code' => 200, 
                'message' => __('admin.SuccessUpdated'), 
                'data' => $model, 
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessUpdated'), $regionContinent->tableComments, $model->id)
            ];
        }else{
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Region\RegionContinent  $regionContinent
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, RegionContinent $regionContinent)
    {
        $validator = Validator::make($request->all(), [
            'id' => ['required',],
        ]);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = is_array($request->id) ? $request->id : [$request->id];
        $model = $regionContinent::whereIn('id', $ids);
        if($model->delete()){
            return [
                'code' => 200, 
                'message' => __('admin.SuccessDestroyed'), 
                'log' => sprintf('[%s][%s]『id:%s』', __('admin.SuccessDestroyed'), $regionContinent->tableComments, json_encode($ids))
            ];
        }else{
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }
}
