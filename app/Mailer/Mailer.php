<?php
/**
 * Created by PhpStorm.
 * author: Han
 * Date: 2019/2/15
 * Time: 下午5:00
 */

namespace App\Mailer;


use Mail;
use Naux\Mail\SendCloudTemplate;

class Mailer
{
    protected function sendTo($template,$email,array $data){

        $content = new SendCloudTemplate($template, $data);

        Mail::raw($content, function ($message) use ($email) {
            $message->from('18374950130@163.com', 'Han');

            $message->to($email);//->cc('18374950130@163.com')
        });
    }
}