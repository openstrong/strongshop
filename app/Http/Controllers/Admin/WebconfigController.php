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
use App\Models\Admin\WebConfig;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Mail;

class WebconfigController extends BaseController
{

    /**
     * 保存配置项值
     * @param Request $request
     * @param Webconfig $webconfig
     */
    public function saveConfig(Request $request, Webconfig $webconfig)
    {
        if (!$request->expectsJson())
        {
            $rows = WebConfig::query()->get();
            $data = [];
            foreach ($rows as $row)
            {
                $data[$row->key] = $row->value;
            }
            return $this->view('webconfig.setconfig', ['data' => $data]);
        }

        WebConfig::query()->update(['value' => null]);
        
        foreach ($request->all() as $key => $value)
        {
            $model = WebConfig::where('key', $key)->first();
            if (!$model)
            {
                $model = new WebConfig();
                $model->key = $key;
            }
            $model->value = $value;
            $model->save();
        }

        //清除缓存
        Cache::forget('webconfig');

        return [
            'code' => 200,
            'message' => '网站配置保存成功',
            'log' => sprintf('[%s][%s]', '网站配置保存成功', $webconfig->tableComments)
        ];
    }

    public function clearcache(Request $request, Webconfig $webconfig)
    {
        Cache::flush();
        return [
            'code' => 200,
            'message' => '清楚缓存成功',
            'log' => sprintf('[%s][%s]', '清楚缓存成功', $webconfig->tableComments)
        ];
    }

    public function sendReceiveMailTest(Request $request, Webconfig $webconfig)
    {
        $validator = Validator::make($request->all(),
                        [
                            'addr' => ['required', 'email'],
                        ],
                        [],
                        [
                            'addr' => '收信邮箱地址',
                        ]
        );
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        try {
            config(['mail.host' => $request->MAIL_HOST]);
            config(['mail.port' => $request->MAIL_PORT]);
            config(['mail.username' => $request->MAIL_USERNAME]);
            config(['mail.password' => $request->MAIL_PASSWORD]);
            config(['mail.encryption' => $request->MAIL_ENCRYPTION]);
            config(['mail.reply_to.address' => $request->MAIL_REPLYTO_ADDRESS]);
            config(['mail.reply_to.name' => $request->MAIL_REPLYTO_NAME]);
            Mail::send('emails.test', [], function($message)use($request) {
                $message->to($request->addr)->subject("测试邮件 - " . config('strongshop.storeName'));
            });
        } catch (\Exception $exc) {
            return [
                'code' => 4001,
                'message' => $exc->getMessage(),
                'log' => sprintf('[%s][%s]', $exc->getMessage(), $webconfig->tableComments)
            ];
        }

        return [
            'code' => 200,
            'message' => '测试邮件发送成功',
            'log' => sprintf('[%s][%s]', '测试邮件发送成功', $webconfig->tableComments)
        ];
    }

}
