<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;

class VerifiedController extends Controller
{
    public function index(Request $request){
        if (Auth::check()) {
            Auth::logout();
        }
        return view('verified');
    }
}
