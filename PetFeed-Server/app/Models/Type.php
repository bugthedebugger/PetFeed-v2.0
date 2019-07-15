<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Type extends Model
{
    protected $fillable = [
        'name'
    ];

    public function pets(){
        return $this->hasMany('App\Models\Pet');
    }

    public function device(){
        return $this->hasMany('App\Models\Device');
    }
}
