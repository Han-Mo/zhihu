<?php

namespace App\Http\Controllers;

use App\Message;
use App\Notifications\NewMessageNotification;
use App\Repositoris\MessageRepository;
use Illuminate\Http\Request;

class InboxController extends Controller
{
    protected $message;

    //
    /**
     * InboxController constructor.
     *
     *
     */
    public function __construct(MessageRepository $message)
    {
        $this->middleware('auth');
        $this->message = $message;
    }

    public function index()
    {
        $message = $this->message->getAllMessages();
     //   return $message;
        return view('inbox.index',['message' => $message->groupBy('dialog_id')]);
    }

    public function show($dialogId)
    {
        $messages = $this->message->getDialogMessagesByDialogId($dialogId);
        $messages->markAsRead();
        return view('inbox.show',compact('messages','dialogId'));
    }

    public function store($dialogId)
    {
        $message = $this->message->getSigleMessageByDialogId($dialogId);
        $toUserId = $message->from_user_id === user()->id ? $message->to_user_id : $message->from_user_id;
        $newMessage = $this->message->create([
            'from_user_id' => user()->id,
            'to_user_id' => $toUserId,
            'body' => request('body'),
            'dialog_id' => $dialogId
        ]);

        $newMessage->toUser->notify(new NewMessageNotification($newMessage));

        return back();
    }
}
