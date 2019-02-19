<?php
/**
 * Created by PhpStorm.
 * author: Han
 * Date: 2019/2/18
 * Time: 下午2:18
 */

namespace App\Repositoris;


use App\Message;

class MessageRepository
{
    public function create(array $attributes)
    {
        return Message::create($attributes);
    }

    public function getAllMessages()
    {
        return Message::where('to_user_id',user()->id)
            ->orWhere('from_user_id',user()->id)
            ->with(['fromUser' => function($query){
                return $query->select(['id','name','avatar']);
            },'toUser'=> function($query){
                return $query->select(['id','name','avatar']);
            }])
            ->latest()
            ->get();
    }

    public function getDialogMessagesByDialogId($dialogId)
    {
        return Message::where('dialog_id',$dialogId)->with(['fromUser' => function($query){
            return $query->select(['id','name','avatar']);
        },'toUser'=> function($query){
            return $query->select(['id','name','avatar']);
        }])->latest()->get();
    }

    public function getSigleMessageByDialogId($dialogId)
    {
        return Message::where('dialog_id',$dialogId)->first();
    }
}