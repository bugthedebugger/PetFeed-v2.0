<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pet extends Model
{
    protected $fillable = [
        'name',
        'type_id',
        'age',
        'weight',
        'user_id'
    ];

    public function user(){
        return $this->belongsTo('App\Models\User');
    }

    public function type(){
        return $this->belongsTo('App\Models\Type');
    }
}
