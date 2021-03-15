<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Message;
class ContactsController extends Controller
{
    public function get(){
        //pun useri in variabila $contacts
        $contacts =User::all();
        return response()->json($contacts);
    }
    public function getMessagesFor($id){
        $messages = Message::where('from', $id)->orWhere('to', $id)->get();

        return response()->json($messages);
    }
}
