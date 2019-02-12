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
    public function create(array $attrbutes){
        $question = Answer::create($attrbutes);
        return $question;
    }
}