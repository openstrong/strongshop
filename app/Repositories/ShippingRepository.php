<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Repositories;

use App\Repositories\AppRepository;
use App\Models\ShippingOption;
use App\Repositories\RegionRepository;

class ShippingRepository
{

    /**
     * 
     * @param type $weight 重量：克
     * @param type $country_code 国家
     * @param type $state_code 省
     */
    public static function getShippingFeeList($weight, $country_code = null, $state_code = null)
    {
        if (!$country_code)
        {
            $country_code = config('strongshop.defaultCountry');
        }
        if (!RegionRepository::getCountry($country_code))
        {
            $country_code = config('strongshop.defaultCountry');
        }
        $rows = ShippingOption::where('status', 1)
                ->with([
                    'shippingOptionConfig' => function($query) use($country_code, $state_code) {
                        $query->where('status', 1)->whereJsonContains('countries', $country_code);
                        if ($state_code)
                        {
                            $query->whereJsonContains('state_code', $state_code);
                        }
                    }])
                ->whereHas('shippingOptionConfig', function($query) use($country_code, $state_code) {
                    $query->where('status', 1)->whereJsonContains('countries', $country_code);
                    if ($state_code)
                    {
                        $query->whereJsonContains('state_code', $state_code);
                    }
                })
                ->get();
        if (!$rows)
        {
            return [];
        }
        foreach ($rows as $row)
        {
            $row->fee = $row->shippingOptionConfig ? self::getFee($weight, $row->shippingOptionConfig->more) : 0;
            unset($row->shippingOptionConfig);
        }
        return $rows->sortBy('fee')->values()->toArray();
    }

    /**
     * 
     * @param type $weight 重量：克
     * @param type $shopping_option_id 配送方式id
     * @param type $country_code 国家
     * @param type $state_code 省
     */
    public static function getShippingFee($weight, $shopping_option_id, $country_code = null, $state_code = null)
    {
        if (!$country_code)
        {
            $country_code = config('strongshop.defaultCountry');
        }
        if (!RegionRepository::getCountry($country_code))
        {
            $country_code = config('strongshop.defaultCountry');
        }
        $row = ShippingOption::where('status', 1)
                ->with([
                    'shippingOptionConfig' => function($query) use($country_code, $state_code) {
                        $query->where('status', 1)->whereJsonContains('countries', $country_code);
                        if ($state_code)
                        {
                            $query->whereJsonContains('state_code', $state_code);
                        }
                    }])
                ->find($shopping_option_id);
        if (!$row || !isset($row->shippingOptionConfig->more))
        {
            return 0;
        }
        return self::getFee($weight, $row->shippingOptionConfig->more);
    }

    public static function getFee($weight, array $config)
    {
        $fee = 0;
        if ($weight <= 0)
        {
            return $fee;
        }
        $range_configs = collect($config['range_wieght'])->sortBy('range.end')->toArray();
        $range_max_weight = end($range_configs)['range']['end']; //重量范围内最大重量值
        $over_weight = $weight <= $range_max_weight ? 0 : ($weight - $range_max_weight); //超出`重量范围`后的重量
        //如果超出`重量范围`
        if ($weight > $range_max_weight)
        {
            $over_weight = $weight - $range_max_weight; //超出`重量范围`后的重量
            $weight = $range_max_weight; //重置重量
            $fee += ceil($over_weight / $config['over_weight']['weight']) * $config['over_weight']['amount']; //超出`重量范围`后的费用
        }
        foreach ($range_configs as $range_config)
        {
            if ($weight >= $range_config['range']['start'] && $weight <= $range_config['range']['end'])
            {
                //首重费用
                $fee += $range_config['first_weight']['amount'];
                //去掉`首重`后剩余的重量
                $weight_surplus = $weight - $range_config['first_weight']['weight'];
                if ($weight_surplus <= 0)
                {
                    break;
                }
                //续重费用
                $fee += ceil($weight_surplus / $range_config['continued_weight']['weight']) * $range_config['continued_weight']['amount'];
                break;
            }
        }

        return AppRepository::convertCurrency($fee);
    }

}
