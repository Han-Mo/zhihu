<?php

namespace App\Http\Controllers;

use App\Repositoris\AnswerRepository;
use App\Repositoris\CommentRepository;
use App\Repositoris\QuestionRepository;
use Auth;


/**
 * Class CommentsController
 * @package App\Http\Controllers
 */
class CommentsController extends Controller
{
    /**
     * @var AnswerRepository
     */
    protected $answer;
    /**
     * @var QuestionRepository
     */
    protected $question;
    /**
     * @var CommentRepository
     */
    protected $comment;

    /**
     * CommentsController constructor.
     * * @param $answer
     * @param $question
     * @param $comment
     *
     */
    public function __construct(AnswerRepository $answer,QuestionRepository $question,CommentRepository $comment)
    {
        $this->answer = $answer;
        $this->question = $question;
        $this->comment = $comment;
    }

    //

    /**
     *
     * answer
     * @param $id
     * @author: Han
     * @modify:
     * @return mixed
     */
    public function answer($id){
        return $this->answer->getAnswerCommentsById($id);
    }

    /**
     *
     * question
     * @param $id
     * @author: Han
     * @modify:
     * @return mixed
     */
    public function question($id){
        return $this->question->getQuestionCommentsById($id);
    }

    /**
     *
     * store
     * @author: Han
     * @modify:
     * @return mixed
     */
    public function store(){
        $model = $this->getModelNameFromType(request('type'));
        return $this->comment->create([
            'commentable_id' => request('model'),
            'commentable_type' => $model,
            'user_id' => user('api')->user()->id,
            'body' => request('body')
        ]);
    }

    /**
     *
     * getModelNameFromType
     * @param $type
     * @author: Han
     * @modify:
     * @return string
     */
    private function getModelNameFromType($type)
    {
        return $type == 'question' ? 'App\Question' : 'App\Answer';
    }

}
