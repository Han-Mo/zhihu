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
}