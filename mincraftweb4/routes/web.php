<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('userlist', [App\Http\Controllers\MessageController::class, 'userlist'])->name('user_list');
Route::get('usermessage/{id}', [App\Http\Controllers\MessageController::class, 'usermessage'])->name('user_message');
Route::post('sendmessage', [App\Http\Controllers\MessageController::class, 'sendmessage'])->name('user_message_send');
Route::get('deletesinglemessage/{id}', [App\Http\Controllers\MessageController::class, 'deletesinglemessage'])->name('user_message_delete_single');
Route::get('deleteallmessage/{id}', [App\Http\Controllers\MessageController::class, 'deleteallmessage'])->name('user_message_delete_all');
