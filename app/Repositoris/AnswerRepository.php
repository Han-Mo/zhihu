<?php
/**
 * Created by PhpStorm.
 * author: Han
 * Date: 2019/2/12
 * Time: 下午4:35
 */

namespace App\Repositoris;


use App\Answer;

class AnswerRepository
{
    public function create(array $attrbutes)
    {
        $question = Answer::create($attrbutes);
        return $question;
    }

    public function byId($id)
    {
        return Answer::find($id);
    }

    public function getAnswerCommentsById($id)
    {
        $answer = Answer::with('comments','comments.user')->where('id',$id)->first();
        return $answer->comments;
    }
}