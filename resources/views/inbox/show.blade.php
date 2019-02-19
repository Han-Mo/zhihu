@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">消息通知</div>

                    <div class="card-body">
                        <form action="/inbox/{{$dialogId}}/store" method="post">
                            {{csrf_field()}}
                            <div class="form-group">
                                <textarea class="form-control" name="body"></textarea>
                            </div>
                            <div class="form-group float-right">
                                <button class="btn btn-success">发送私信</button>
                            </div>
                        </form>
                        <div class="messages-list">
                            @foreach($messages as $message)
                                <div class="media ">
                                    <img width="44" src="{{$message->fromUser->avatar}}" class="mr-3" alt="">
                                    <div class="media-body">
                                        <h4 class="mt-0">{{$message->fromUser->name}}</h4>
                                        <p>
                                            <a href="/inbox/{{$message->dialog_id}}">
                                                {{$message->body}} <span class="float-right">{{$message->created_at->format('Y-m-d')}}</span>
                                            </a>
                                        </p>
                                    </div>
                                </div>
                            @endforeach
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
