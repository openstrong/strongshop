<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Auth\Events\Login;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Repositories\AuthRepository;
use App\Notifications\User\SendSecurityCodeNotification;

class LoginController extends Controller
{

    use AuthenticatesUsers;

    public $maxAttempts = 3; //允许登错几次
    public $decayMinutes = 1; //登录失败超过 $maxAttempts 次 禁止 $decayMinutes 分钟登录

    public function __construct()
    {
        $this->maxAttempts = 3;
        $this->decayMinutes = 1;
    }

    /**
     * Show the application login form.
     *
     * @return \Illuminate\Http\Response
     */
    public function showLoginForm(Request $request)
    {
        $redirectTo = $request->session()->pull('url.intended', $request->server('HTTP_REFERER', url('/')));
        return view('auth.login', ['redirectTo' => $redirectTo]);
    }

    public function showLoginCodeForm(Request $request)
    {
        $redirectTo = $request->session()->pull('url.intended', $request->server('HTTP_REFERER', url('/')));
        return view('auth.login', ['redirectTo' => $redirectTo]);
    }

    /**
     * 登录
     * @param Request $request
     * @return type
     */
    public function login(Request $request)
    {
        $rules = [
            'username' => ['required', 'string', 'email', 'max:255', 'exists:user,email'],
            'way' => ['string', 'min:4', 'max:99', 'in:code,password'], //登录方式
            'password' => ['required_if:way,password', 'string', 'min:6'],
            'code' => ['required_if:way,code', 'string'],
            'remember' => ['boolean'],
        ];
        $messages = [];
        $customAttributes = [
            'username' => __('Email'),
            'password' => __('Password'),
        ];
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        /**
         * 登录失败次数限制
         * If the class is using the ThrottlesLogins trait, we can automatically throttle
         * the login attempts for this application. We'll key this by the username and
         * the IP address of the client making these requests into this application.
         */
        if (method_exists($this, 'hasTooManyLoginAttempts') && $this->hasTooManyLoginAttempts($request))
        {
            $this->fireLockoutEvent($request);
            $replace = [
                'seconds' => $this->decayMinutes * 60,
                'minutes' => $this->decayMinutes
            ];
            return ['code' => 4001, 'message' => __('auth.throttle', $replace)];
        }
        $user_name = $this->username(); //登录字段
        $user = User::where($user_name, $request->username)->first();
        if (!$user || $user->status !== 1)
        {
            return ['code' => 4010, 'message' => __('auth.failed')];
        }
        //验证码登录
        if ($request->way === 'code')
        {
            $_code = AuthRepository::getCode($request->username);
            if ($_code !== $request->code)
            {
                return ['code' => 4001, 'message' => __('Invalid verification code')];
            }
        } else
        {
            if (!Hash::check($request->password, $user->password))
            {
                $this->incrementLoginAttempts($request); //累加登录失败次数
                return ['code' => 4002, 'message' => __('auth.failed')];
            }
        }

        if ($this->isApi)
        {
            //api登录
            $user->api_token = Str::random(32);
            //触发`登录成功`事件（如果是web登录 `Auth::guard($this->guard)->login()` 已自动触发事件，无需再次触发）
            event(new Login($this->guard, $user, $request->remember));
        } else
        {
            //web登录
            Auth::guard($this->guard)->login($user, $request->remember);
            if ($user instanceof MustVerifyEmail && !$user->hasVerifiedEmail())
            {
                $request->session()->flash('status', __('Your email address is not verified. It is strongly recommended that you verify the email'));
            }
        }

        /*
         *  登录成功后逻辑
         */
        $this->clearLoginAttempts($request); //清除登录锁定
        $user->last_login_ip = $request->ip();
        $user->last_login_at = now();
        $user->save();

        return ['code' => 200, 'message' => __('Success'), 'data' => [
                'token' => $user->api_token,
        ]];
    }

    /**
     * 验证码
     * @return type
     */
    public function loginCode(Request $request)
    {
        $rules = [
            'username' => ['required', 'string', 'email', 'max:255', 'exists:user,email'],
        ];
        $messages = [];
        $customAttributes = [
            'username' => __('Email'),
        ];
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $user = User::where($this->username(), $request->username)->first();
        if (!$user || $user->status !== 1)
        {
            return ['code' => 4010, 'message' => __('auth.failed')];
        }
        $code = (string) random_int(100000, 999999);
        AuthRepository::setCode($request->username, $code);
        $user->notify(new SendSecurityCodeNotification($code));
        return ['code' => 200, 'message' => __('Verification code mail sent successfully. If you have not received it, please check your spam folder.')];
    }

    /**
     * Log the user out of the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function logout(Request $request)
    {
        $this->guard()->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect($request->server('HTTP_REFERER', url('/')));
    }

    /**
     * 登录字段
     * @return string
     */
    public function username()
    {
        return 'email';
    }

}
