<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;
use App\Models\User\UserPushNotification;

class SendPushNotification implements ShouldQueue
{

    use Dispatchable,
        InteractsWithQueue,
        Queueable,
        SerializesModels;

    public $user;
    public $userPushNotification;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($user, UserPushNotification $userPushNotification)
    {
        $this->user = $user;
        $this->userPushNotification = $userPushNotification;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $user = $this->user;
        $userPushNotification = $this->userPushNotification;
        if (!$userPushNotification)
        {
            return false;
        }
        if ($userPushNotification->status != 1)
        {
            return false;
        }
        $data = [
            'title' => $userPushNotification->title,
            'content' => $userPushNotification->content,
        ];
        $message = (new \App\Mail\Promotional($user, $data));
        Mail::to($user)->send($message);
    }

}
