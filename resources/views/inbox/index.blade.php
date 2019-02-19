@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">消息通知</div>

                    <div class="card-body">
                        @foreach($message as $messageGrop)
                            <div class="media  {{$messageGrop->first()->shouldAddUnreadClass() ? 'list-group-item-warning': ''}}">
                                @if(Auth::id() == $messageGrop->last()->from_user_id)
                                    <img width="44" src="{{$messageGrop->last()->toUser->avatar}}" class="mr-3" alt="">
                                @else
                                    <img width="44" src="{{$messageGrop->last()->fromUser->avatar}}" class="mr-3" alt="">
                                @endif

                                <div class="media-body">
                                    @if(Auth::id() == $messageGrop->last()->from_user_id)
                                        <h4 class="mt-0">{{$messageGrop->last()->toUser->name}}</h4>
                                    @else
                                        <h4 class="mt-0">{{$messageGrop->last()->fromUser->name}}</h4>
                                    @endif

                                    <p>
                                        <a href="/inbox/{{$messageGrop->first()->dialog_id}}">
                                            {{$messageGrop->first()->body}}
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
@endsection
