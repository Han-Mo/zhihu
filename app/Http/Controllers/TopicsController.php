<?php

namespace App\Http\Controllers;

use App\Repositoris\TopicsRepository;
use Request;

class TopicsController extends Controller
{
    protected $topics;

    /**
     * TopicsController constructor.
     * * @param $topics
     *
     */
    public function __construct(TopicsRepository $topics)
    {
        $this->topics = $topics;
    }


    //
    public function index(Request $request)
    {
        $this->topics->getTopicsForTagging($request);
    }
}
