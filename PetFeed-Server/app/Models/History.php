<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class History extends Model
{
    protected $fillable = [
        'schedule_uid',
        'feedingDate'
    ];

    public function schedule() {
        return $this->belongsTo('App\Models\Schedule', 'schedule_uid', 'uId');
    }
}
