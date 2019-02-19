<?php
/**
 * Created by PhpStorm.
 * author: Han
 * Date: 2019/2/19
 * Time: 上午9:57
 */

namespace App\Repositoris;


use App\Topic;
use Request;

class TopicsRepository
{
    public function getTopicsForTagging(Request $request)
    {
        $topics = Topic::select(['id','name'])
            ->where('name','like','%'.$request->query('q').'%')
            ->get();
        return $topics;
    }
}