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
        'password',
        'type_id'
    ];

    protected $hidden = [
        'password'
    ];

    public function user(){
        return $this->belongsTo('App\User');
    }

    public function type(){
        return $this->belongsTo('App\Models\Type');
    }

    public function schedule(){
        return $this->hasMany('App\Models\Schedule');
    }
}
