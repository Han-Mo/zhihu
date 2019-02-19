<?php
/**
 * Created by PhpStorm.
 * author: Han
 * Date: 2019/2/19
 * Time: 下午3:58
 */

namespace App;


use Illuminate\Database\Eloquent\Collection;

class MessageCollection extends Collection
{
    public function markAsRead()
    {
        $this->each(
            function ($message){
                if($message->to_user_id == user()->id)
                {
                    $message->markAsRead();
                }
            }
        );
    }
}