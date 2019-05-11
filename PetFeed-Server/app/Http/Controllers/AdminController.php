<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Device;
use Session;
use App\Models\Type;
use Hash;

class AdminController extends Controller
{
    public function registerDeviceview(Request $request) {
        $types = Type::all();

        return view('register', compact('types'));
    }

    public function registerDevice(Request $request) {
        $this->validate($request, [
            'deviceId' => 'required|unique:devices',
            'type' => 'required'
        ]);
        $password = Hash::make(str_random());

        try {
            \DB::beginTransaction();
            $device = Device::create([
                'deviceId' => $request->deviceId,
                'password' => $password,
                'type_id' => $request->type
            ]);
            \DB::commit();
            Session::flash('success', 'Device registered');
            Session::flash('info', '<b>DevicdeID:</b> '.$request->deviceId.'<br> <b>Password:</b> '.$password);
            event(new \App\Events\RegisterDevice($device->deviceId, $password));
        } catch (\Exception $e) {
            \DB::rollback();
            Session::flash('error', 'Something went wrong!');
            \Log::error($e);
        }
        return back();
    }
}
