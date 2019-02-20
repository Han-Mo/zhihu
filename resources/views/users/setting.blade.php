@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">设置个人信息</div>

                    <div class="card-body">
                        <form method="POST" action="{{ route('setting-store') }}">
                            @csrf

                            <div class="form-group row">
                                <label for="city" class="col-md-4 col-form-label text-md-right">{{ __('现居城市') }}</label>

                                <div class="col-md-6">
                                    <input id="city" type="text" value="{{user()->settings['city']}}" class="form-control{{ $errors->has('city') ? ' is-invalid' : '' }}" name="city" required>

                                    @if ($errors->has('city'))
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('city') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="bio" class="col-md-4 col-form-label text-md-right">{{ __('个人简介') }}</label>

                                <div class="col-md-6">
                                    <textarea id="bio" type="text"  class="form-control{{ $errors->has('bio') ? ' is-invalid' : '' }}" name="bio" required>{{user()->settings['bio']}}
                                    </textarea>

                                    @if ($errors->has('bio'))
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('bio') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group row mb-0">
                                <div class="col-md-6 offset-md-4">
                                    <button type="submit" class="btn btn-primary">
                                        {{ __('更新资料') }}
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
