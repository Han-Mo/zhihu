<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/', 'QuestionsController@index')->name('index');
/*Route::get('/', function () {
    return view('welcome');
});*/

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/email/verify/{token}','EmailController@verify')->name('verify');
Route::resource('questions','QuestionsController',['names' => [
    'create' => 'question.create',
    'show' => 'question.show',
    'edit' => 'question.edit',
    'update' => 'question.update'
]]);
Route::post('questions/{question}/answer','AnswersController@store')->name('answer');

Route::get('questions/{question}/follow','QuestionFollowController@follow')->name('follow');
//Route::get('/email/verify/{token}',['as'=>'email.verify','user'=>'EmailController@verify']);
//Route::post('questions/{question}/answer','AnswersController@store')->name('answer');

Route::get('notifications','NotificationsController@index')->name('notifications-index');
Route::get('notifications/{notification}','NotificationsController@show')->name('notifications-show');

Route::get('avatar','UsersController@avatar')->name('avatar');
Route::post('avatar','UsersController@changeAvatar')->name('changeAvatar');

Route::get('password','PasswordController@password')->name('avatar');
Route::post('password/update','PasswordController@update')->name('password-update');

Route::get('setting','SettingController@index')->name('setting');
Route::post('password/update','SettingController@store')->name('setting-store');

Route::get('inbox','InboxController@index')->name('inbox');
Route::get('inbox/{dialogId}','InboxController@show')->name('inbox-show');
Route::post('inbox/{dialogId}/store','InboxController@store')->name('inbox-store');