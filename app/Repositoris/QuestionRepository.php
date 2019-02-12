<?php
/**
 * Created by PhpStorm.
 * author: Han
 * Date: 2019/2/1
 * Time: 下午3:15
 */

namespace App\Repositoris;


use App\Question;
use App\Topic;

class QuestionRepository
{
    public function byIdWithTopics($id){
        return $question = Question::where('id',$id)->with('topics')->first();
    }

    public function create(array $attrbutes){
        return $question = Question::create($attrbutes);
    }

    public function normalizeTopic(array $topics)
    {
        return collect($topics)->map(function($topics){
            if(is_numeric($topics)){
                return (int) $topics;
            }
            $newTopic = Topic::create(['name' => $topics,'questions_count' => 1]);
            return $newTopic->id;
        });

    }

    public function byId(int $id)
    {
        return Question::find($id);
    }

    public function getQuestionsFeed()
    {
        return Question::published()->latest('updated_at')->with('user')->get();
    }
}