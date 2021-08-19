<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('login', 'Auth\LoginController@login');
Route::post('logout', 'Auth\LoginController@logout');
Route::post('register', 'Auth\RegisterController@register');
Route::post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail');
Route::post('password/reset', 'Auth\ResetPasswordController@reset');
Route::post('password/confirm', 'Auth\ConfirmPasswordController@confirm');
Route::post('email/resend', 'Auth\VerificationController@resend');

//产品列表
Route::get('product/category', 'Product\ProductController@index');
//产品详情
Route::get('product', 'Product\ProductController@show');
//加入购物车
Route::get('product/shoppingcart', 'Product\ShoppingCartController@products');
Route::post('product/shoppingcart/create', 'Product\ShoppingCartController@create');
Route::post('product/shoppingcart/remove', 'Product\ShoppingCartController@remove');

