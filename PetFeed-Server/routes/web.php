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

Route::get('/', 'WelcomeController@welcome')->name('welcome');

Auth::routes(['verify' => true]);

Route::get('/verified', 'VerifiedController@index');

Route::group(['middleware' => ['auth', 'admin','verified']], function () {
    Route::get('/home', 'HomeController@index')->name('home');
    Route::get('/register-device', 'AdminController@registerDeviceview')->name('register.device');
    Route::post('/register-device', 'AdminController@registerDevice')->name('register.device');
});


