<?php
/**
 * Created by PhpStorm.
 * author: Han
 * Date: 2019/2/20
 * Time: 下午4:11
 */

namespace App;


class Setting
{
    protected $allowed = ['city','bio'];
    protected $user;
    /**
     * Setting constructor.
     *
     *
     */
    public function __construct(User $user)
    {
        $this->user = $user;
    }

    public function merge(array $attributes)
    {
        $settings = array_merge(user()->settings,array_only($attributes,$this->allowed));
        return $this->user->update(['settings' => $settings]);
    }
}