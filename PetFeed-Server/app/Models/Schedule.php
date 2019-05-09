<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Schedule extends Model
{
    protected $fillable = [
        'day',
        'time',
        'user_id',
        'pet_id',
        'amount',
        'device_id'
    ];

    public function user(){
        return $this->belongsTo('App\User');
    }

    public function pet(){
        return $this->belongsTo('App\Models\Pet');
    }

    public function device(){
        return $this->belongsTo('App\Models\Device');
    }

    public function feedingInfo(){
        return $this->hasMany('App\Models\FeedingInfo');
    }
}
