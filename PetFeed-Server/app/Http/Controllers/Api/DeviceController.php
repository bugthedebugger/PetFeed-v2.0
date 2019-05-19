<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Device;
use Hash;
use Auth;
class DeviceController extends Controller
{
    public function stopHopper(Request $request) {
        $this->validate($request, [
            'deviceId' => 'required'
        ]);

        $authDevices = Auth::User()->device;
        $deviceLinked = false;
        $device = [];

        foreach($authDevices as $authDevice) {
            if ($authDevice->deviceId == $request->deviceId) {
                $device = $authDevice;
                $deviceLinked = true;
                break;
            }
        }

        if ($deviceLinked) {
            event(new \App\Events\StopHopper($device->deviceId));
            return response()->json([
                'message' => 'Device hopper start event sent'
            ]);
        } else {
            abort(401, 'This device isn\'t linked to your account!');
        }
    }

    public function startHopper(Request $request) {
        $this->validate($request, [
            'deviceId' => 'required'
        ]);

        $authDevices = Auth::User()->device;
        $deviceLinked = false;
        $device = [];

        foreach($authDevices as $authDevice) {
            if ($authDevice->deviceId == $request->deviceId) {
                $device = $authDevice;
                $deviceLinked = true;
                break;
            }
        }

        if ($deviceLinked) {
            event(new \App\Events\StartHopper($device->deviceId));
            return response()->json([
                'message' => 'Device hopper start event sent'
            ]);
        } else {
            abort(401, 'This device isn\'t linked to your account!');
        }
    }

    public function status(Request $request) {
        $this->validate($request, [
            'deviceId' => 'required'
        ]);

        $message = [];

        try
        {
            event(new \App\Events\DeviceStatus($request->deviceId));
            $message = [
                'message' => 'Status signal sent'
            ];
        } catch (\Exception $e) {
            abort(500, $e);
        }

        return response()->json($message);

    }

    public function login(Request $request){

        $this->validate($request, [
            'deviceId',
            'password'
        ]);

        $code = 200;
        $user = Auth::User()->id;
        $device = Device::where(
            'deviceId', $request->deviceId
        )->first();

        if ($device != null) {
            if ($request->password === $device->password)
            {
                $device->user_id = $user;
                $device->save();
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

                event(new \App\Events\Configure($device->deviceId, $token, $device->type->name));
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
                'type' => $device->type->name,
                'message' => 'success'
            ];

            event(new App\Events\Configure($device->deviceId, $token, $device->type->name));

            \DB::commit();
        }catch(\Exception $e){
            \DB::rollback();
            abort(500, $e);
        }

        return response()->json($message, $code);
    }

    public function resetPassword(Request $request) {
        $this->validate($request, [
            'deviceId' => 'required'
        ]);

        $authDevices = Auth::User()->device;
        $deviceLinked = false;
        $device = [];

        foreach($authDevices as $authDevice) {
            if ($authDevice->deviceId == $request->deviceId) {
                $device = $authDevice;
                $deviceLinked = true;
                break;
            }
        }

        if ($deviceLinked) {
            $newPassword = Hash::make(str_random());
            $oldPassword = $device->password;

            try {
                \DB::beginTransaction();
                $device->password = $newPassword;
                $device->save();
                event(new \App\Events\ResetPassword($device->deviceId, $oldPassword, $newPassword));
                \DB::commit();
            } catch (\Exception  $e) {
                \DB::rollback();
                abort(500, $e);
            }
            return response()->json([
                'message' => 'success',
                'newPassword' => $newPassword
            ]);
        } else {
            abort(401, 'This device isn\'t linked to your account!');
        }
    }

    public function shutdown(Request $request) {
        $this->validate($request, [
            'deviceId' => 'required'
        ]);

        $authDevices = Auth::User()->device;
        $found = false;

        foreach($authDevices as $authDevice) {
            if ( $authDevice->deviceId === $request->deviceId ) {
                event(new \App\Events\Shutdown($authDevice->deviceId));
                $found = true;
                break;
            }
        }

        if($found)
        {
            return response()->json([
                'message' => 'Shutdown signal sent!'
            ]);
        } else {
            abort(401, 'This device isn\'t linked to your account!');
        }
    }

    public function restart(Request $request) {
        $this->validate($request, [
            'deviceId' => 'required'
        ]);

        $authDevices = Auth::User()->device;
        $found = false;

        foreach($authDevices as $authDevice) {
            if ( $authDevice->deviceId === $request->deviceId ) {
                event(new \App\Events\Restart($authDevice->deviceId));
                $found = true;
                break;
            }
        }

        if($found)
        {
            return response()->json([
                'message' => 'Restart signal sent!'
            ]);
        } else {
            abort(401, 'This device isn\'t linked to your account!');
        }
    }

    public function treat(Request $request) {
        $this->validate($request, [
            'deviceId' => 'required',
            'amount' => 'required'
        ]);

        $authDevices = Auth::User()->device;
        $found = false;

        foreach($authDevices as $authDevice) {
            if ( $authDevice->deviceId === $request->deviceId ) {
                event(new \App\Events\Treat($authDevice->deviceId, $request->amount));
                $found = true;
                break;
            }
        }

        if($found)
        {
            return response()->json([
                'message' => 'Treat signal sent!'
            ]);
        } else {
            abort(401, 'This device isn\'t linked to your account!');
        }
    }
}
