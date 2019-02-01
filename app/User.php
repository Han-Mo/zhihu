<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Mail;
use Naux\Mail\SendCloudTemplate;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','avatar','confirmation_token',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function sendPasswordResetNotification($token){
        $data = [
            'url' => url(config('app.url').route('password.reset', $token, false)),
            'name' => $this->email
        ];
        $template = new SendCloudTemplate('zhihu_reset_password', $data);

        Mail::raw($template, function ($message) {
            $message->from('18374950130@163.com', 'Han');

            $message->to($this->email);//->cc('18374950130@163.com')
        });
    }

    public function owns(Model $model){
        return $this->id == $model->user_id;
    }
}
