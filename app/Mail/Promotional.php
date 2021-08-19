<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

/**
 * 促销邮件
 */

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class Promotional extends Mailable
{

    use Queueable,
        SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($user, $data)
    {
        $mail_config = config('mail.batchMail');
        config(['mail' => $mail_config]);
        
        $this->locale(config('app.locale')); //本地化
        $this->subject($data['title']); //邮件标题
        //模板
        $this->view('emails.promotional', [
            'user' => $user,
            'data' => $data,
        ]);
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $this->withSwiftMessage(function ($message) {
            $headers = config('mail.batchMail.headers');
            if (!empty($headers))
            {
                foreach ($headers as $name => $value)
                {
                    $message->getHeaders()->addTextHeader($name, $value);
                }
            }
        });
    }

}
