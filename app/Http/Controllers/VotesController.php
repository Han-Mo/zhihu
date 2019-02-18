<?php

namespace App\Http\Controllers;

use App\Repositoris\AnswerRepository;
use Auth;
use http\Env\Response;
use Illuminate\Http\Request;

class VotesController extends Controller
{
    protected $answer;

    /**
     * VotesController constructor.
     * * @param $answer
     *
     */
    public function __construct(AnswerRepository $answer)
    {
        $this->answer = $answer;
    }

    //
    public function users($id)
    {
        $user = Auth::guard('api')->user();
        if($user->haVoteFor($id)){
            return response()->json(['voted' => true]);
        }

        return response()->json(['voted' => false]);
    }

    public function vote()
    {
        $answer = $this->answer->byId(request('answer'));
        $voted = Auth::guard('api')->user()->voteFor(request('answer'));
      //  $followed = Auth::guard('api')->user()->followThisUser($userToFollow->id);
        if(count($voted['attached']) > 0){
           // $userToFollow->notify(new NewUserFollowNotification());
            $answer->increment('votes_count');
            return response()->json(['voted' => true ]);
        }
        $answer->decrement('votes_count');
        return response()->json(['voted' => false ]);
    }
}
