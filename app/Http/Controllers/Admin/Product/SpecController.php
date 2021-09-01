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
use App\Models\Product\Spec;
use App\Models\Product\SpecGroup;
use App\Rules\NotExists;

class SpecController extends BaseController
{

    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product\Spec  $spec
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, Spec $spec)
    {
        if (!$request->expectsJson())
        {
            $specGroups = SpecGroup::query()->get();
            return $this->view('product.spec.index', ['model' => $spec, 'specGroups' => $specGroups]);
        }
        $model = Spec::orderBy(($request->field ?: 'id'), ($request->order ?: 'desc'));
        $model->with('specGroup:id,name');
        if ($request->spec_group_id)
        {
            $model->where('spec_group_id', $request->spec_group_id);
        }
        if ($request->name)
        {
            $model->where('name', 'like', "%{$request->name}%");
        }
        if ($request->spec_type)
        {
            $model->where('spec_type', $request->spec_type);
        }
        if ($request->input_type)
        {
            $model->where('input_type', $request->input_type);
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
                    'id' => ['required', 'integer', Rule::exists('spec')],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = Spec::find($request->id);
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
     * @param  \App\Models\Product\Spec  $spec
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, Spec $spec)
    {
        if (!$request->expectsJson())
        {
            $specGroups = SpecGroup::query()->get();
            return $this->view('product.spec.form', ['model' => $spec, 'specGroups' => $specGroups]);
        }
        $rules = array_merge_recursive($spec->rules(), [
            'spec_group_id' => [Rule::unique('spec')->where("name", $request->name ?: " ")],
            'name' => [Rule::unique('spec')->where("spec_group_id", $request->spec_group_id ?: " ")],
        ]);
        $messages = $spec->messages();
        $customAttributes = $spec->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $spec->fill($request->all());
        if ($spec->save())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessCreated'),
                'data' => $spec,
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessCreated'), $spec->tableComments, $spec->id)
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
     * @param  \App\Models\Product\Spec  $spec
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Spec $spec)
    {
        if (!$request->expectsJson())
        {
            $model = $spec::find($request->id);
            $specGroups = SpecGroup::query()->get();
            return $this->view('product.spec.form', ['model' => $model, 'specGroups' => $specGroups]);
        }
        $rules = array_merge_recursive($spec->rules(), [
            'id' => ['required', 'integer', Rule::exists('spec')],
            'spec_group_id' => [Rule::unique('spec')->where("name", $request->name ?: " ")->ignore($request->id)],
            'name' => [Rule::unique('spec')->where("spec_group_id", $request->spec_group_id ?: " ")->ignore($request->id)],
        ]);
        $messages = $spec->messages();
        $customAttributes = $spec->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = $spec::find($request->id);
        $model->fill($request->all());
        if ($model->save())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessUpdated'),
                'data' => $model,
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessUpdated'), $spec->tableComments, $model->id)
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
     * @param  \App\Models\Product\Spec  $spec
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, Spec $spec)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required', new NotExists('product_spec', 'spec_id', '该产品规格已被使用，无法删除')],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = is_array($request->id) ? $request->id : [$request->id];
        $model = $spec::whereIn('id', $ids);
        if ($model->delete())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessDestroyed'),
                'log' => sprintf('[%s][%s]『id:%s』', __('admin.SuccessDestroyed'), $spec->tableComments, json_encode($ids))
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

}
