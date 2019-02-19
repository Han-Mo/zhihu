<?php

namespace App\Http\Controllers;

use App\Question;
use App\Repositoris\QuestionRepository;
use Auth;
use Illuminate\Http\Request;

class QuestionFollowController extends Controller
{
    protected $question;
    public function __construct(QuestionRepository $question)
    {
        $this->middleware('auth');
        $this->question = $question;
    }

    public function follow($question){
        Auth::user()->followThis($question);
        return back();
    }

    public function follower(Request $request){
        //$user = user('api'); //Auth::guard('api')->user();  //获取使用api的用户信息
       // $followed = user('api')->followed($request->get('question'));
        if(user('api')->followed($request->get('question'))){
            return response()->json(['followed' => true ]);
        }
        return response()->json(['followed' => false ]);
    }

    public function followThisQuestion(Request $request){
      //  $user = Auth::guard('api')->user();  //获取使用api的用户信息
        $question = $this->question->byId($request->get('question'));
        $followed = user('api')->followThis($question->id);
        if(count($followed['detached']) > 0){
            $question->decrement('followers_count');
            return response()->json(['followed' => false ]);
        }

        $question->increment('followers_count');
        return response()->json(['followed' => true ]);
    }


}
