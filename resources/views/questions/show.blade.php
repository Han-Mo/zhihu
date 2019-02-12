@extends('layouts.app')@section('content')    <div class="container">        <div class="row">            <div class="col-md-8 col-md-offset-2">                <div class="card card-default">                    <div class="card-header">                        {{ $question->title }}                        <div style="float: right">                            @foreach($question->topics as $topic)                                <a class="topic" href="/topic/{{$topic->id}}">{{$topic->name}}</a>                            @endforeach                        </div>                    </div>                    <div class="card-body">                        {!! $question->body !!}                    </div>                    <div class="actions">                        @if(Auth::check() && Auth::user()->owns($question))                           <span class="edit"><a href="/questions/{{$question->id}}/edit">编辑</a></span>                            <form action="/questions/{{$question->id}}" method="POST" class="delete-form">                                {{method_field('DELETE')}}                                {{csrf_field()}}                                <button class="button is-naked delete-button">删除</button>                            </form>                        @endif                    </div>                </div>            </div>        </div>    </div>    <!-- 实例化编辑器 -->    <script type="text/javascript">        var ue = UE.getEditor('container');        ue.ready(function() {            ue.execCommand('serverparam', '_token', csrf_token()); // 设置 CSRF token.        });    </script>@endsection