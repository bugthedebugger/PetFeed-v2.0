<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Device;
use Hash;

class DeviceController extends Controller
{
    public function login(Request $request){
        $this->validate($request, [
            'deviceId',
            'password'
        ]);

        $code = 200;

        $device = Device::where(
            'deviceId', $request->deviceId
        )->first();



        if ($device != null) {
            if (Hash::check($request->password, $device->password))
            {
                \DB::table('oauth_access_tokens')
                    ->where([
                        ['user_id', $device->id],
                        ['name', 'PetFeed Device']
                    ])
                    ->update(
                        [
                            'revoked' => true
                        ]
                    );

                $token = $device->createToken('PetFeed Device')->accessToken;

                $message = [
                    'message' => 'success',
                    'deviceId' => $device->deviceId,
                    'token' => $token
                ];

                event(new \App\Events\Configure($device->deviceId, $token));
            }
            else {
                abort(401, 'Unauthenticated');
            }
        } else {
            abort(401, 'Unauthenticated');
        }

        return response()->json($message, $code);
    }

    public function register(Request $request){
        $this->validate($request, [
            'deviceId' => 'required',
            'password' => 'required',
            'type_id' => 'required'
        ]);

        $message = [];
        $code = 200;

        try{
            \DB::beginTransaction();
            $device = Device::create([
                'deviceId' => $request->deviceId,
                'password' => bcrypt($request->password),
                'type_id' => $request->type_id
            ]);

            $token = $device->createToken('PetFeed Device')->accessToken;

            $message = [
                'deviceId' => $device->deviceId,
                'token' => $token,
                'message' => 'success'
            ];

            event(new App\Events\Configure($device->deviceId, $token));

            \DB::commit();
        }catch(\Exception $e){
            \DB::rollback();
            abort(500, $e);
        }

        return response()->json($message, $code);
    }
}
