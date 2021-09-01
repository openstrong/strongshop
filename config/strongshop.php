<?php

return [
    'storeName' => config('app.name'), //商店简称
    'defaultLanguage' => config('app.locale'), //默认语言
    'defaultCountry' => 'US', //默认国家 `US`美国简码

    /**
     * 货币&价格
     */
    'defaultCurrency' => 'USD', //前台默认显示货币
    'defaultCurrencyBackend' => 'USD', //后台管理默认使用货币（修改此参数请记得调整下面的`汇率/转换率`）
    'defaultCurrencyPay' => 'USD', //订单结算货币：null 代表按照前台选择的货币进行结算，否则将强制转换成此货币结算。
    'defaultDedimal' => 3, //价格小数位数
    'showShipingFeeInCart' => true, //在购物车中显示运费
    'showShipinglistInCart' => true, //在购物车中支持选择配送方式
    'showCountriesInCart' => true, //在购物车中支持选择国家
    /**
     * 产品图片配置
     */
    'productImage' => [
        'uploadLimitMimes' => 'jpg,jpeg', //限制上传图片类型:jpg,jpeg,gif,png
        'uploadLimitSize' => 200, //限制上传大小 单位：kb
        'uploadLimitWidth' => null, //限制上传宽度：像素 px ，设置为 null 则为不限制
        'uploadLimitHeight' => null, //限制上传高度：像素 px ，设置为 null 则为不限制
        //缩略图生成配置
        'thumb' => [
            'suffix_name' => '_thumb', //缩略图后缀名称
            'width' => 300, //生成宽度
            'height' => null, //生成高度，设置为null，则为自适应高度
        ],
    ],
    /**
     * 语言
     */
    'langs' => [
        'en' => [
            'code' => 'en', //语言简码
            'name' => 'English', //语言名称
            'currency' => 'USD', //货币符号
        ],
        'zh-CN' => [
            'code' => 'zh-CN',
            'name' => '简体中文',
            'currency' => 'CNY',
        ],
    ],
    /**
     * 货币和汇率(转换率)
     */
    'currencies' => [
        //人民币
        'CNY' => [
            'name' => '¥CNY',
            'code' => 'CNY',
            'rate' => 6.3945,
        ],
        //美元
        'USD' => [
            'name' => '$USD',
            'code' => 'USD',
            'rate' => 1, //汇率
        ],
        //欧元
        'EUR' => [
            'name' => '€EUR',
            'code' => 'EUR',
            'rate' => 0.83,
        ],
        //英镑
        'GBP' => [
            'name' => '£GBP',
            'code' => 'GBP',
            'rate' => 0.70,
        ],
        //澳元
        'AUD' => [
            'name' => '$AUD',
            'code' => 'AUD',
            'rate' => 1.34,
        ],
        //加元
        'CAD' => [
            'name' => '$CAD',
            'code' => 'CAD',
            'rate' => 1.23,
        ],
    ],
    /**
     * 支付配置
     */
    'payment' => [
        //paypal
        'paypal' => [
            'business' => env('PAYMENT_PAYPAL_BUSINESS'), //收款账号
            'env' => env('PAYMENT_PAYPAL_ENV', 'sandbox'), //环境
        ],
    ],
];
