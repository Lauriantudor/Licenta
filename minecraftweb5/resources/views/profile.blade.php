@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
    <div class="col-md-10 col-md-offset-1">
        <img src="/image/{{$user->avatar}}" style="width:150px; height:150px; float:left; border-radius:50%; margin-right:25px;">
        <h2>{{$user->name}}'s Profile</h2>
        <form method="post" action="/profile" enctype="multipart/form-data">
        @csrf
        <input type="file" name="avatar">
        <input type="submit" class="pull-right btn btn-sm btn-primary">
        </form>
    </div>
    </div>
</div>

@endsection
