<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Auth;

class UsersController extends Controller
{
    public function register(Request $request){

        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|unique:users',
            'password' => 'required'
        ]);

        $message = [];
        $user = [];

        $code = 200;

        try{
            \DB::beginTransaction();
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => bcrypt($request->password)
            ]);

            $message[] = [
                'name' => $user->name,
                'email' => $user->email,
                'token' => $user->createToken('PetFeed')->accessToken,
                'message' => 'success'
            ];
            \DB::commit();
        }catch(\Exception $e){
            \Log::error($e);
            \DB::rollback();
            $code = 500;
            $message = [
                'message' => $e,
            ];
        }

        return response()->json($message, $code);
    }

    public function login(Request $request){
        $this->validate($request, [
            'email' => 'required',
            'password' => 'required'
        ]);

        $message = [];
        $code = 200;

        $user = Auth::attempt(['email' => $request->email, 'password' => $request->password]);
        if($user){
            \DB::table('oauth_access_tokens')
                ->where('user_id', Auth::user()->id)
                ->update(
                    [
                        'revoked' => true
                    ]
                );
            $message = [
                'message' => 'success',
                'name' => Auth::user()->name,
                'email' => Auth::user()->email,
                'token' => Auth::user()->createToken('PetFeed')->accessToken
            ];
        } else {
            abort(401, 'Unauthenticated');
        }

        return response()->json($message, $code);
    }
}
