<?php
/**
 * Created by PhpStorm.
 * author: Han
 * Date: 2019/2/15
 * Time: 下午4:33
 */

namespace App\Channels;




use Illuminate\Notifications\Notification;

class SendCloudChannel
{
    public function send($notifiable,Notification $notification){
        $message = $notification->toSendCloud($notifiable);
    }
}