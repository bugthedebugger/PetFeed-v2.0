<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/register', 'Api\UsersController@register');
Route::post('/login', 'Api\UsersController@login');
Route::post('/device/register', 'Api\DeviceController@register');
Route::group(['middleware' => ['auth:api']], function () {
    Route::get('/test', function(){
        return 'success';
    });
    Route::post('/device/login', 'Api\DeviceController@login');
    Route::post('/device/reset-password', 'Api\DeviceController@resetPassword');
    Route::post('/device/shutdown', 'Api\DeviceController@shutdown');
    Route::post('/device/restart', 'Api\DeviceController@restart');
    Route::post('/device/treat', 'Api\DeviceController@treat');
});
