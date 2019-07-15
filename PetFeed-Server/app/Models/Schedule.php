<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Schedule extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'day',
        'time',
        'user_id',
        'pet_id',
        'amount',
        'device_id',
        'uId',
        'groupId',
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

    public function histories() {
        return $this->hasMany('App\Models\History', 'schedule_uid', 'uId');
    }
}
