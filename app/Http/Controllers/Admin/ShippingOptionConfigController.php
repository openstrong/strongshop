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
use App\Models\ShippingOptionConfig;
use App\Models\Region\RegionCountry;

class ShippingOptionConfigController extends BaseController
{

    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ShippingOptionConfig  $shippingOptionConfig
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, ShippingOptionConfig $shippingOptionConfig)
    {
        if (!$request->expectsJson())
        {
            return $this->view('shippingOptionConfig.index', ['model' => $shippingOptionConfig]);
        }
        $model = ShippingOptionConfig::orderBy(($request->field ?: 'id'), ($request->order ?: 'desc'));
        if ($request->id)
        {
            $model->where('id', $request->id);
        }
        if ($request->title)
        {
            $model->where('title', 'like', "%{$request->title}%");
        }
        if ($request->shipping_option_id)
        {
            $model->where('shipping_option_id', $request->shipping_option_id);
        }
        if ($request->countries)
        {
            $model->where('countries', 'like', "%{$request->countries}%");
        }
        if ($request->states)
        {
            $model->where('states', 'like', "%{$request->states}%");
        }
        if ($request->more)
        {
            $model->where('more', 'like', "%{$request->more}%");
        }
        if ($request->status)
        {
            $model->where('status', $request->status);
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
                    'id' => ['required', 'integer', Rule::exists('shipping_option_config')],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = ShippingOptionConfig::find($request->id);
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
     * @param  \App\Models\ShippingOptionConfig  $shippingOptionConfig
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, ShippingOptionConfig $shippingOptionConfig)
    {
        if (!$request->expectsJson())
        {
            //国家
            $countries = RegionCountry::query()->orderBy('en_name')->get();
            if ($request->create)
            {
                $shippingOptionConfig->more = [
                    'range_wieght' => [
                        [
                            'range' => [
                                'start' => '',
                                'end' => '',
                            ],
                            'first_weight' => [
                                'weight' => '',
                                'amount' => '',
                            ],
                            'continued_weight' => [
                                'weight' => '',
                                'amount' => '',
                            ],
                        ]
                    ],
                    'over_weight' => [
                        'weight' => '',
                        'amount' => '',
                    ],
                ];
            }
            return $this->view('shippingOptionConfig.form', ['model' => $shippingOptionConfig, 'countries' => $countries]);
        }
        $rules = array_merge_recursive($shippingOptionConfig->rules(), [
        ]);
        $messages = $shippingOptionConfig->messages();
        $customAttributes = $shippingOptionConfig->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        foreach ($request->countries as $country)
        {
            $exists_config = ShippingOptionConfig::where('shipping_option_id', $request->shipping_option_id)->where('id', '<>', $request->id)->whereJsonContains('countries', $country)->first();
            if ($exists_config)
            {
                $exists_country = RegionCountry::where('iso2', $country)->first();
                return ['code' => 4001, 'message' => sprintf('国家[%s, %s, %s]已存在于： %s', $exists_country->iso2, $exists_country->en_name, $exists_country->cn_name, $exists_config->title)];
            }
        }
        $shippingOptionConfig->fill($request->all());
        $shippingOptionConfig->countries = array_values($request->countries);
        if ($shippingOptionConfig->save())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessCreated'),
                'data' => $shippingOptionConfig,
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessCreated'), $shippingOptionConfig->tableComments, $shippingOptionConfig->id)
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
     * @param  \App\Models\ShippingOptionConfig  $shippingOptionConfig
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ShippingOptionConfig $shippingOptionConfig)
    {
        if (!$request->expectsJson())
        {
            //国家
            $countries = RegionCountry::query()->orderBy('en_name')->get();
            $model = $shippingOptionConfig::find($request->id);
            $more = $model->more;
            if ($request->create)
            {
                $more['range_wieght'][] = [
                    'range' => [
                        'start' => '',
                        'end' => '',
                    ],
                    'first_weight' => [
                        'weight' => '',
                        'amount' => '',
                    ],
                    'continued_weight' => [
                        'weight' => '',
                        'amount' => '',
                    ],
                ];
            }
            if ($request->removeRule !== null)
            {
                unset($more['range_wieght'][$request->removeRule]);
            }
            $model->more = $more;
            return $this->view('shippingOptionConfig.form', ['model' => $model, 'countries' => $countries]);
        }
        $rules = array_merge_recursive($shippingOptionConfig->rules(), [
            'id' => ['required', 'integer', Rule::exists('shipping_option_config')],
        ]);
        $messages = $shippingOptionConfig->messages();
        $customAttributes = $shippingOptionConfig->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        foreach ($request->countries as $country)
        {
            $exists_config = ShippingOptionConfig::where('shipping_option_id', $request->shipping_option_id)->where('id', '<>', $request->id)->whereJsonContains('countries', $country)->first();
            if ($exists_config)
            {
                $exists_country = RegionCountry::where('iso2', $country)->first();
                return ['code' => 4001, 'message' => sprintf('国家[%s, %s, %s]已存在于： %s', $exists_country->iso2, $exists_country->en_name, $exists_country->cn_name, $exists_config->title)];
            }
        }

        $model = $shippingOptionConfig::find($request->id);
        $model->fill($request->all());
        $model->countries = array_values($request->countries);
        if ($model->save())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessUpdated'),
                'data' => $model,
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessUpdated'), $shippingOptionConfig->tableComments, $model->id)
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
     * @param  \App\Models\ShippingOptionConfig  $shippingOptionConfig
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, ShippingOptionConfig $shippingOptionConfig)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required',],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = is_array($request->id) ? $request->id : [$request->id];
        $model = $shippingOptionConfig::whereIn('id', $ids);
        if ($model->delete())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessDestroyed'),
                'log' => sprintf('[%s][%s]『id:%s』', __('admin.SuccessDestroyed'), $shippingOptionConfig->tableComments, json_encode($ids))
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

}
