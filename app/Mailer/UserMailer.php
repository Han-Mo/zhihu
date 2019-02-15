<?php
/**
 * Created by PhpStorm.
 * author: Han
 * Date: 2019/2/15
 * Time: 下午5:04
 */

namespace App\Mailer;


use App\User;
use Auth;

class UserMailer extends Mailer
{
    public function followNotifyEmail($email){
        $data = [
            'url' => 'http://zhihu.test',
            'name' => Auth::guard('api')->user()->name,
        ];

        $this->sendTo('zhihu_guanzhu',$email,$data);
    }

    public function sendPasswordReset($email,$token){
        $data = [
            'url' => url(config('app.url').route('password.reset', $token, false)),
        ];
        $this->sendTo('zhihu_reset_password',$email,$data);
    }

    public function welcome(User $user){
        $data = [
            'url' => route('email.verify',['token' => $user->confirmation_token]),
            'name' => $user->name
        ];
        $this->sendTo('zhihu_register',$user->email,$data);
    }
}