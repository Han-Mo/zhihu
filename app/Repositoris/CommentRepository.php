<?php
/**
 * Created by PhpStorm.
 * author: Han
 * Date: 2019/2/18
 * Time: 下午5:42
 */

namespace App\Repositoris;


use App\Comment;

class CommentRepository
{
    public function create(array $attributus){
        $comment = Comment::create($attributus);
        return $comment;
    }
}