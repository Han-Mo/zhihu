<?php
/**
 * Created by PhpStorm.
 * author: Han
 * Date: 2019/2/14
 * Time: 上午10:50
 */

namespace App;


use Illuminate\Database\Eloquent\Model;

class Follow extends Model
{
    protected $table = 'user_question';

    protected $fillable = ['user_id','question_id'];
}