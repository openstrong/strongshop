<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Models\Order;

use Illuminate\Database\Eloquent\Model;
use App\Repositories\RegionRepository;
use App\Repositories\AppRepository;

class Order extends Model
{

    use \Illuminate\Database\Eloquent\SoftDeletes;

    public $tableComments = '订单管理';
    protected $table = 'order';
    protected $guarded = ['id', 'created_at', 'updated_at', 'deleted_at'];
    protected $appends = ['country', 'state', 'currency', 'order_status_label', 'order_status_style'];

    const STATUS_UNPAID = 10; //待支付
    const STATUS_PAID = 12; //已支付
    const STATUS_PAY_FAILED = 13; //支付失败
    const STATUS_PAY_EXCEPTION = 14; //支付异常
    const STATUS_SHIPPED = 20; //已发货
    const STATUS_RECEIVED = 22; //已收获
    const STATUS_RETURNING = 24; //退货中
    const STATUS_RETURNED = 26; //已退货
    const STATUS_DONE = 30; //已完成
    const STATUS_CANCELED = 40; //已取消（会员取消）
    const STATUS_CLOSED = 42; //已关闭(管理员关闭)

    /**
     * Validator rules
     * @param type $on
     * @return type
     */
    public function rules()
    {
        return [
            'user_id' => ['nullable', 'nullable', 'integer'],
            'order_no' => ['nullable', 'string', 'max:100'],
            'products_amount' => ['nullable', 'numeric', 'gt:0'],
            'handling_fee' => ['nullable', 'numeric'],
            'shipping_fee' => ['nullable', 'numeric'],
            'discount_amount' => ['nullable', 'numeric'],
            'order_amount' => ['nullable', 'numeric', 'gt:0'],
            'paid_amount' => ['nullable', 'numeric'],
            'used_credits_amount' => ['nullable', 'numeric'],
            'order_status' => ['nullable', 'integer', 'min:1'],
            'shipping_option_id' => ['nullable', 'integer', 'min:1'],
            'payment_option_id' => ['nullable', 'integer', 'min:1'],
            'remark' => ['nullable', 'string', 'max:255'],
            'first_name' => ['nullable', 'string', 'max:255'],
            'last_name' => ['nullable', 'string', 'max:255'],
            'email' => ['nullable', 'string', 'max:255'],
            'phone' => ['nullable', 'string', 'max:255'],
            'fax' => ['nullable', 'string', 'max:255'],
            'country_code' => ['nullable', 'string', 'max:255'],
            'state_code' => ['nullable', 'string', 'max:255'],
            'state_other' => ['nullable', 'string', 'max:255'],
            'city' => ['nullable', 'string', 'min:1', 'max:255'],
            'address_line_1' => ['nullable', 'string', 'max:255'],
            'address_line_2' => ['nullable', 'string', 'max:255'],
            'postal_code' => ['nullable', 'string', 'max:255'],
            'billing_first_name' => ['nullable', 'string', 'max:255'],
            'billing_last_name' => ['nullable', 'string', 'max:255'],
            'billing_email' => ['nullable', 'string', 'max:255'],
            'billing_phone' => ['nullable', 'string', 'max:255'],
            'billing_fax' => ['nullable', 'string', 'max:255'],
            'billing_country_code' => ['nullable', 'string', 'max:255'],
            'billing_state_code' => ['nullable', 'string', 'max:255'],
            'billing_state_other' => ['nullable', 'string', 'max:255'],
            'billing_city' => ['nullable', 'string', 'max:255'],
            'billing_address_line_1' => ['nullable', 'string', 'max:255'],
            'billing_address_line_2' => ['nullable', 'string', 'max:255'],
            'billing_postal_code' => ['nullable', 'string', 'max:255'],
            'created_at' => ['date'],
            'updated_at' => ['date'],
            'deleted_at' => ['date'],
            'tracking_no' => ['nullable', 'string', 'max:255'],
            'shipping_remark' => ['nullable', 'string', 'max:255'],
        ];
    }

    /**
     * Validator messages
     * @return type
     */
    public function messages()
    {
        return [];
    }

    /**
     * Validator customAttributes
     * @return type
     */
    public function customAttributes()
    {
        return [
            'id' => '订单id',
            'user_id' => '会员',
            'order_no' => '订单编号',
            'currency_code' => '结算货币',
            'products_amount' => '产品总额',
            'handling_fee' => '支付手续费',
            'shipping_fee' => '配送费用',
            'tax_fee' => '税收费用',
            'discount_amount' => '优惠金额',
            'order_amount' => '订单金额',
            'paid_amount' => '已付金额',
            'used_credits_amount' => '积分金额',
            'order_status' => '订单状态',
            'shipping_option_id' => '配送方式',
            'payment_option_id' => '支付方式',
            'pay_remark' => '支付备注',
            'transaction_id' => '交易单号',
            'remark' => '订单备注',
            'first_name' => '名',
            'last_name' => '姓',
            'email' => 'EMAIL',
            'phone' => '联系电话',
            'fax' => '传真',
            'country_code' => '国家',
            'state_code' => '省',
            'state_other' => '其他省',
            'city' => '城市',
            'address_line_1' => '地址1',
            'address_line_2' => '地址2',
            'postal_code' => '邮编',
            'billing_first_name' => '名(账单)',
            'billing_last_name' => '姓(账单)',
            'billing_email' => 'Email(账单)',
            'billing_phone' => '联系电话(账单)',
            'billing_fax' => '传真(账单)',
            'billing_country_code' => '国家(账单)',
            'billing_state_code' => '省(账单)',
            'billing_state_other' => '其他省(账单)',
            'billing_city' => '城市(账单)',
            'billing_address_line_1' => '地址1(账单)',
            'billing_address_line_2' => '地址2(账单)',
            'billing_postal_code' => '邮编(账单)',
            'created_at' => '下单时间',
            'updated_at' => '更新时间',
            'deleted_at' => '删除时间',
            'currency' => '结算货币',
            'country' => '国家',
            'state' => '省',
            'paid_at' => '支付时间',
            'received_at' => '确认收货时间',
            'tracking_no' => '跟踪单号',
            'shipping_remark' => '配送备注',
            'canceled_at' => '取消订单时间',
            'returned_at' => '退货时间',
            'shipped_at' => '发货时间',
            'weight_total' => '产品总重',
            'currency_rate' => '货币转换率',
        ];
    }

    public function getAttributeLabel($key)
    {
        $datas = $this->customAttributes();
        return $datas[$key] ?? $key;
    }

    /**
     * Fill the model with an array of attributes.
     * @param type $attributes
     * @return $this
     */
    public function fill($attributes)
    {
        foreach ($attributes as $key => $attribute)
        {
            if ($attribute === null)
            {
                unset($attributes[$key]);
            }
        }
        parent::fill($attributes);
        return $this;
    }

    /**
     * 国家名称
     * @return string
     */
    public function getCountryAttribute()
    {
        if (isset($this->attributes['country_code']))
        {
            return RegionRepository::getCountry($this->attributes['country_code']);
        }
        return '';
    }

    /**
     * 省名称
     * @return string
     */
    public function getStateAttribute()
    {
        if (isset($this->attributes['country_code']) && isset($this->attributes['state_code']))
        {
            return RegionRepository::getState($this->attributes['country_code'], $this->attributes['state_code']);
        }
        return '';
    }

    /**
     * 货币名称
     * @return string
     */
    public function getCurrencyAttribute()
    {
        if (!isset($this->attributes['currency_code']) || !$this->attributes['currency_code'])
        {
            return '';
        }
        return AppRepository::getCurrencies($this->attributes['currency_code'])['name'] ?? '';
    }

    public function getOrderStatus($status = null)
    {
        $data = [
            self::STATUS_UNPAID => [
                'name' => __('Unpaid'),
                'style' => 'layui-bg-orange',
            ],
            self::STATUS_PAID => [
                'name' => __('Paid'),
                'style' => 'layui-bg-green',
            ],
            self::STATUS_PAY_EXCEPTION => [
                'name' => __('Pay Exception'),
                'style' => '',
            ],
            self::STATUS_PAY_FAILED => [
                'name' => __('Pay Failed'),
                'style' => '',
            ],
            self::STATUS_SHIPPED => [
                'name' => __('Shipped'),
                'style' => 'layui-bg-cyan',
            ],
            self::STATUS_RECEIVED => [
                'name' => __('Received'),
                'style' => 'layui-bg-cyan',
            ],
            self::STATUS_RETURNING => [
                'name' => __('Returning'),
                'style' => 'layui-bg-orange',
            ],
            self::STATUS_RETURNED => [
                'name' => __('Returned'),
                'style' => 'layui-bg-cyan',
            ],
            self::STATUS_DONE => [
                'name' => __('Done'),
                'style' => 'layui-bg-green',
            ],
            self::STATUS_CANCELED => [
                'name' => __('Canceled'),
                'style' => 'layui-bg-gray',
            ],
            self::STATUS_CLOSED => [
                'name' => __('Closed'),
                'style' => 'layui-bg-gray',
            ],
        ];
        if (!$status)
        {
            return $data;
        }
        return $data[$status] ?? [];
    }

    /**
     * 订单状态名称
     * @return string
     */
    public function getOrderStatusLabelAttribute()
    {
        if (!isset($this->attributes['order_status']))
        {
            return '';
        }
        $value = $this->attributes['order_status'];
        $data = $this->getOrderStatus($value);
        return $data['name'] ?? '';
    }

    /**
     * 订单状态样式[后台]
     * @return string
     */
    public function getOrderStatusStyleAttribute()
    {
        if (!isset($this->attributes['order_status']))
        {
            return '';
        }
        $value = $this->attributes['order_status'];
        $data = $this->getOrderStatus($value);
        return $data['style'] ?? '';
    }

    public function getCurrencyRateAttribute($value)
    {
        return floatval($value);
    }

    /**
     * 订单产品
     * @return type
     */
    public function orderProducts()
    {
        return $this->hasMany(OrderProduct::class);
    }

    /**
     * 购买会员
     * @return type
     */
    public function buyer()
    {
        return $this->belongsTo(\App\Models\User::class, 'user_id');
    }

    /**
     * 配送方式
     */
    public function shippingOption()
    {
        return $this->belongsTo(\App\Models\ShippingOption::class, 'shipping_option_id');
    }

    /**
     * 支付方式
     */
    public function paymentOption()
    {
        return $this->belongsTo(\App\Models\PaymentOption::class, 'payment_option_id');
    }

}
