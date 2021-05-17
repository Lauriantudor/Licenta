<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
class Message extends Model
{
    use HasFactory;
    /**
     * The attributes aren't mass asignable.
     *
     * @var array
     */
    protected $guarded=[];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
