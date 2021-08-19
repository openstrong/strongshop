<?php

/*
  |--------------------------------------------------------------------------
  | Admin Routes
  |--------------------------------------------------------------------------
  |
 */

Route::get('captcha', function () {
    return Captcha::create(); //图片验证码 
});
Route::any('login', 'Admin\AdminAuthController@login');
Route::any('logout', 'Admin\AdminAuthController@logout');
Route::get('/home', 'Admin\IndexController@home'); //home 主页
Route::get('index/panel', 'Admin\IndexController@panel'); //面板
Route::get('index/panel', 'Admin\IndexController@panel'); //网站设置
//上传
Route::post('upload/image', 'Common\UploadController@image'); //上传图片
Route::post('upload/image/wangeditor', 'Common\UploadController@imageWangEditor'); //富文本图片上传【wangEditor】
//操作日志
Route::any('adminLog/index', 'Admin\AdminLogController@index');
Route::any('adminLog/destroy', 'Admin\AdminLogController@destroy');
//菜单管理
Route::any('adminMenu/index', 'Admin\AdminMenuController@index');
Route::any('adminMenu/create', 'Admin\AdminMenuController@create');
Route::any('adminMenu/update', 'Admin\AdminMenuController@update');
Route::any('adminMenu/destroy', 'Admin\AdminMenuController@destroy');
//角色管理
Route::any('adminRole/index', 'Admin\AdminRoleController@index');
Route::any('adminRole/create', 'Admin\AdminRoleController@create');
Route::any('adminRole/update', 'Admin\AdminRoleController@update');
Route::any('adminRole/destroy', 'Admin\AdminRoleController@destroy');
Route::any('adminRole/assignPermissions', 'Admin\AdminRoleController@assignPermissions');
//账号管理
Route::any('adminUser/index', 'Admin\AdminUserController@index');
Route::any('adminUser/show', 'Admin\AdminUserController@show');
Route::any('adminUser/create', 'Admin\AdminUserController@create');
Route::any('adminUser/update', 'Admin\AdminUserController@update');
Route::any('adminUser/destroy', 'Admin\AdminUserController@destroy');
//产品管理
Route::any('product/index', 'Admin\Product\ProductController@index');
Route::any('product/show', 'Admin\Product\ProductController@show');
Route::any('product/create', 'Admin\Product\ProductController@create')->name('product.create');
Route::any('product/update', 'Admin\Product\ProductController@update');
Route::any('product/destroy', 'Admin\Product\ProductController@destroy');
Route::any('product/copy', 'Admin\Product\ProductController@copy');
Route::any('product/spec/htmlString', 'Admin\Product\ProductController@specHtmlString');
//产品分类
Route::any('product/category/index', 'Admin\Product\CategoryController@index');
Route::any('product/category/show', 'Admin\Product\CategoryController@show');
Route::any('product/category/create', 'Admin\Product\CategoryController@create');
Route::any('product/category/update', 'Admin\Product\CategoryController@update');
Route::any('product/category/destroy', 'Admin\Product\CategoryController@destroy');
//产品规格组
Route::any('product/specGroup/index', 'Admin\Product\SpecGroupController@index');
Route::any('product/specGroup/show', 'Admin\Product\SpecGroupController@show');
Route::any('product/specGroup/create', 'Admin\Product\SpecGroupController@create');
Route::any('product/specGroup/update', 'Admin\Product\SpecGroupController@update');
Route::any('product/specGroup/destroy', 'Admin\Product\SpecGroupController@destroy');
//产品规格
Route::any('product/spec/index', 'Admin\Product\SpecController@index');
Route::any('product/spec/show', 'Admin\Product\SpecController@show');
Route::any('product/spec/create', 'Admin\Product\SpecController@create');
Route::any('product/spec/update', 'Admin\Product\SpecController@update');
Route::any('product/spec/destroy', 'Admin\Product\SpecController@destroy');
//产品品牌
Route::any('product/brand/index', 'Admin\Product\BrandController@index');
Route::any('product/brand/show', 'Admin\Product\BrandController@show');
Route::any('product/brand/create', 'Admin\Product\BrandController@create');
Route::any('product/brand/update', 'Admin\Product\BrandController@update');
Route::any('product/brand/destroy', 'Admin\Product\BrandController@destroy');
//订单管理
Route::any('order/index', 'Admin\OrderController@index');
Route::any('order/show', 'Admin\OrderController@show');
Route::any('order/create', 'Admin\OrderController@create');
Route::any('order/update', 'Admin\OrderController@update');
Route::any('order/destroy', 'Admin\OrderController@destroy');
Route::any('order/confirm/close', 'Admin\OrderController@close'); //确认关闭
Route::any('order/confirm/paid', 'Admin\OrderController@confirmPaid'); //确认已付款
Route::any('order/confirm/shipped', 'Admin\OrderController@confirmShipped'); //确认发货
Route::any('order/confirm/returned', 'Admin\OrderController@confirmReturned'); //确认已退货
Route::any('order/confirm/done', 'Admin\OrderController@confirmDone'); //确认已完成
Route::any('order/products', 'Admin\OrderController@products'); //订单产品
Route::any('order/print', 'Admin\OrderController@print'); //打印
//会员管理
Route::any('user/index', 'Admin\User\UserController@index');
Route::any('user/show', 'Admin\User\UserController@show');
Route::any('user/create', 'Admin\User\UserController@create');
Route::any('user/update', 'Admin\User\UserController@update');
Route::any('user/destroy', 'Admin\User\UserController@destroy');
//文章管理
Route::any('article/article/index', 'Admin\Article\ArticleController@index');
Route::any('article/article/show', 'Admin\Article\ArticleController@show');
Route::any('article/article/create', 'Admin\Article\ArticleController@create');
Route::any('article/article/update', 'Admin\Article\ArticleController@update');
Route::any('article/article/destroy', 'Admin\Article\ArticleController@destroy');
//文章分类
Route::any('article/category/index', 'Admin\Article\CategoryController@index');
Route::any('article/category/show', 'Admin\Article\CategoryController@show');
Route::any('article/category/create', 'Admin\Article\CategoryController@create');
Route::any('article/category/update', 'Admin\Article\CategoryController@update');
Route::any('article/category/destroy', 'Admin\Article\CategoryController@destroy');
//意见反馈
Route::any('user/feedback/index', 'Admin\User\FeedbackController@index');
Route::any('user/feedback/show', 'Admin\User\FeedbackController@show');
Route::any('user/feedback/update', 'Admin\User\FeedbackController@update');
Route::any('user/feedback/destroy', 'Admin\User\FeedbackController@destroy');
//会员等级
Route::any('user/userRank/index', 'Admin\User\UserRankController@index');
Route::any('user/userRank/show', 'Admin\User\UserRankController@show');
Route::any('user/userRank/create', 'Admin\User\UserRankController@create');
Route::any('user/userRank/update', 'Admin\User\UserRankController@update');
Route::any('user/userRank/destroy', 'Admin\User\UserRankController@destroy');
//配送方式管理
Route::any('shippingOption/index', 'Admin\ShippingOptionController@index');
Route::any('shippingOption/show', 'Admin\ShippingOptionController@show');
Route::any('shippingOption/create', 'Admin\ShippingOptionController@create');
Route::any('shippingOption/update', 'Admin\ShippingOptionController@update');
//Route::any('shippingOption/destroy', 'Admin\ShippingOptionController@destroy');
//配送方式管理-配送区域
Route::any('shippingOptionConfig/index', 'Admin\ShippingOptionConfigController@index');
Route::any('shippingOptionConfig/show', 'Admin\ShippingOptionConfigController@show');
Route::any('shippingOptionConfig/create', 'Admin\ShippingOptionConfigController@create');
Route::any('shippingOptionConfig/update', 'Admin\ShippingOptionConfigController@update');
Route::any('shippingOptionConfig/destroy', 'Admin\ShippingOptionConfigController@destroy');
//支付方式管理
Route::any('paymentOption/index', 'Admin\PaymentOptionController@index');
Route::any('paymentOption/show', 'Admin\PaymentOptionController@show');
Route::any('paymentOption/create', 'Admin\PaymentOptionController@create');
Route::any('paymentOption/update', 'Admin\PaymentOptionController@update');
//Route::any('paymentOption/destroy', 'Admin\PaymentOptionController@destroy');
//地区-国家管理
Route::any('region/regionCountry/index', 'Admin\Region\RegionCountryController@index');
Route::any('region/regionCountry/show', 'Admin\Region\RegionCountryController@show');
Route::any('region/regionCountry/create', 'Admin\Region\RegionCountryController@create');
Route::any('region/regionCountry/update', 'Admin\Region\RegionCountryController@update');
Route::any('region/regionCountry/destroy', 'Admin\Region\RegionCountryController@destroy');
//地区-大陆管理
Route::any('region/regionContinent/index', 'Admin\Region\RegionContinentController@index');
Route::any('region/regionContinent/show', 'Admin\Region\RegionContinentController@show');
Route::any('region/regionContinent/create', 'Admin\Region\RegionContinentController@create');
Route::any('region/regionContinent/update', 'Admin\Region\RegionContinentController@update');
Route::any('region/regionContinent/destroy', 'Admin\Region\RegionContinentController@destroy');
//网站配置
Route::any('webconfig/show', 'Admin\WebconfigController@showForm');//配置详情
Route::any('webconfig/save/config', 'Admin\WebconfigController@saveConfig');//保存配置
Route::any('webconfig/clearcache', 'Admin\WebconfigController@clearcache');//清楚缓存
Route::any('webconfig/sendReceiveMailTest', 'Admin\WebconfigController@sendReceiveMailTest');//清楚缓存
