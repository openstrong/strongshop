<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Auth\Events\Registered;
use App\Models\User;
use Illuminate\Validation\Rule;
use App\Repositories\RegionRepository;
use Illuminate\Contracts\Auth\MustVerifyEmail;

class RegisterController extends Controller
{

    /**
     * Show the application registration form.
     *
     * @return \Illuminate\Http\Response
     */
    public function showRegisterForm()
    {
        return view('auth.register');
    }

    /**
     * Handle a registration request for the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request, User $user)
    {
        $rules = [
            'first_name' => ['required', 'string', 'min:1', 'max:50'],
            'last_name' => ['required', 'string', 'min:1', 'max:50'],
            'country_code' => ['required', 'string', Rule::in(collect(RegionRepository::countries())->keys())],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:user'],
            'password' => ['required', 'string', 'min:6', 'confirmed'],
            'remember' => ['boolean'],
        ];
        $messages = [];
        $customAttributes = [
            'first_name' => __('First Name'),
            'last_name' => __('Last Name'),
            'country_code' => __('Country'),
            'email' => __('Email'),
            'password' => __('Password'),
        ];
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            if ($this->isApi)
            {
                return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
            }
            return $validator->validate(); //自动重定向到当前路由
        }

        $user->first_name = $request->first_name;
        $user->last_name = $request->last_name;
        $user->country_code = $request->country_code;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->status = 1;
        $user->last_login_at = now();
        $user->last_login_ip = $request->getClientIp();
        $user->save();

        //触发`注册成功`事件
        event(new Registered($user));

        if ($this->isApi)
        {
            return ['code' => 200, 'message' => 'Success'];
        }

        //注册成功后自动登录
        Auth::guard()->login($user, $request->remember);

        if ($user instanceof MustVerifyEmail && !$user->hasVerifiedEmail())
        {
            $request->session()->flash('status', __('A fresh verification link has been sent to your email address.') . ' ' . __('Before proceeding, please check your email for a verification link.'));
        }

        return redirect(url('/'));
    }

}
