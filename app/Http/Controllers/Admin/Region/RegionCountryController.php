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
use App\Models\Region\RegionCountry;

class RegionCountryController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Region\RegionCountry  $regionCountry
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, RegionCountry $regionCountry)
    {
        if (!$request->expectsJson())
        {
            return $this->view('region.regionCountry.index', ['model' => $regionCountry]);
        }
        $model = RegionCountry::orderBy(($request->field ?: 'id'), ($request->order ?: 'desc'));
        $model->with('continent');
        if ($request->id) {
            $model->where('id', $request->id);
        }
        if ($request->continent_iso2) {
            $model->where('continent_iso2', 'like', "%{$request->continent_iso2}%");
        }
        if ($request->en_name) {
            $model->where('en_name', 'like', "%{$request->en_name}%");
        }
        if ($request->cn_name) {
            $model->where('cn_name', 'like', "%{$request->cn_name}%");
        }
        if ($request->iso2) {
            $model->where('iso2', 'like', "%{$request->iso2}%");
        }
        if ($request->iso3) {
            $model->where('iso3', 'like', "%{$request->iso3}%");
        }
        if ($request->iso_num) {
            $model->where('iso_num', 'like', "%{$request->iso_num}%");
        }
        if ($request->capital) {
            $model->where('capital', 'like', "%{$request->capital}%");
        }
        if ($request->more) {
            $model->where('more', 'like', "%{$request->more}%");
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
            'id' => ['required', 'integer', Rule::exists('region_country')],
        ]);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = RegionCountry::find($request->id);
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
     * @param  \App\Models\Region\RegionCountry  $regionCountry
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, RegionCountry $regionCountry)
    {
        if (!$request->expectsJson())
        {
            return $this->view('region.regionCountry.form', ['model' => $regionCountry]);
        }
        $rules = array_merge_recursive($regionCountry->rules(), [
        ]);
        $messages = $regionCountry->messages();
        $customAttributes = $regionCountry->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $regionCountry->fill($request->all());
        if($regionCountry->save())
        {
            return [
                'code' => 200, 
                'message' => __('admin.SuccessCreated'), 
                'data' => $regionCountry, 
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessCreated'), $regionCountry->tableComments, $regionCountry->id)
            ];
        }else{
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Region\RegionCountry  $regionCountry
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, RegionCountry $regionCountry)
    {
        if (!$request->expectsJson())
        {
            $model = $regionCountry::find($request->id);
            return $this->view('region.regionCountry.form', ['model' => $model]);
        }
        $rules = array_merge_recursive($regionCountry->rules(), [
            'id' => ['required', 'integer', Rule::exists('region_country')],
        ]);
        $messages = $regionCountry->messages();
        $customAttributes = $regionCountry->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = $regionCountry::find($request->id);
        $model->fill($request->all());
        if($model->save())
        {
            return [
                'code' => 200, 
                'message' => __('admin.SuccessUpdated'), 
                'data' => $model, 
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessUpdated'), $regionCountry->tableComments, $model->id)
            ];
        }else{
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Region\RegionCountry  $regionCountry
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, RegionCountry $regionCountry)
    {
        $validator = Validator::make($request->all(), [
            'id' => ['required',],
        ]);
        if ($validator->fails()) {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = is_array($request->id) ? $request->id : [$request->id];
        $model = $regionCountry::whereIn('id', $ids);
        if($model->delete()){
            return [
                'code' => 200, 
                'message' => __('admin.SuccessDestroyed'), 
                'log' => sprintf('[%s][%s]『id:%s』', __('admin.SuccessDestroyed'), $regionCountry->tableComments, json_encode($ids))
            ];
        }else{
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }
}
