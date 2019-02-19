<?php
/**
 * Created by PhpStorm.
 * author: Han
 * Date: 2019/2/15
 * Time: 下午2:15
 */

namespace App\Repositoris;


use App\User;

class UserRepository
{
    public function byId($id)
    {
        return User::find($id);
    }
}