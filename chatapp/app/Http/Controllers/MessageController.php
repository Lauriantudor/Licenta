<?php

namespace App\Http\Controllers;

use App\Models\Message;
use Illuminate\Http\Request;
use App\Models\User;
use App\Events\MessageSend;
use Image;

class MessageController extends Controller
{
    public function __construct(){
        $this->middleware('auth');
    }
    public function userlist(){
        $users = User::where('id', '!=', auth()->user()->id)->get();
        $unreadId = Message::select(\DB::raw('`from` as sender_id, count(`from`) as messages_count'))
            ->where('to', auth()->user()->id)
            ->where('read',false)
            ->where('type',1)
            ->groupBy('from')
            ->get();

        $users= $users->map(function($user) use ($unreadId){
            $userUnread = $unreadId->where('sender_id', $user->id)->first();

            $user->unread= $userUnread ? $userUnread->messages_count:0;
            return $user;
        });
        if(\Request::ajax()){
            return response()->json($users,200);
        }
        return abort(404);

    }
    public function usermessage($id=null){
       if(!\Request::ajax()){
            return abort(404);
        }
        $user= User::findOrFail($id);
        $messages=$this->messagebyuserid($id);  
        return response()->json([
            'messages'=>$messages,
            'user'=>$user
            ]);

    }
    public function sendmessage(Request $request){
        if(!$request->ajax()){
            abort(404);
        }
        
        $messages =Message::create([
            'message'=>$request->message,
            'from'=>auth()->user()->id,
            'to'=>$request->user_id,
            'type'=>0,
        ]);
         $messages =Message::create([
            'message'=>$request->message,
            'from'=>auth()->user()->id,
            'to'=>$request->user_id,
            'type'=>1,
        ]);
         
            broadcast(new MessageSend($messages));
        return response()->json($messages, 201);
    }
    public function deletesinglemessage($id=null)
    {
       if(!\Request::ajax()){
           return abort(404);
       }
       Message::findOrFail($id)->delete();
       return response()->json('deleted',200);
    }
    public function deleteallmessage($id=null){
       $messages=$this->messagebyuserid($id);    
       foreach ($messages as $value) {
           Message::findOrFail($value->id)->delete();
       }   
       return response()->json('all deleted', 200);

    }
    public function messagebyuserid($id){

        Message::where('from', $id)->where('to', auth()->user()->id)->update(['read'=>true]);
        $messages = Message::where(function($q) use($id){
            $q->where('from',auth()->user()->id);
            $q->where('to', $id);
            $q->where('type', 0);
        })->orWhere(function($q) use($id){
            $q->where('from',$id);
            $q->where('to', auth()->user()->id);
            $q->where('type', 1);
        })->with('user')->get();
        return $messages;
    }
}
