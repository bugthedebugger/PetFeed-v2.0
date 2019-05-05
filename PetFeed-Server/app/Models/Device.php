<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;

class Device extends Model
{
    use HasApiTokens;

    protected $fillable = [
        'deviceId',
        'user_id',
        'password'
    ];

    // protected $hidden = [
    //     'password'
    // ];

    public function user(){
        return $this->belongsTo('App\User');
    }
}
