<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FeedingInfo extends Model
{
    protected $fillable = [
        'schedule_id',
        'fed'
    ];

    public function schedule(){
        return $this->belongsTo('App\Models\Schedule');
    }
}
