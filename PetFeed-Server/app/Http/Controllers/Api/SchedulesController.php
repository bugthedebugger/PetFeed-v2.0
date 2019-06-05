<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Device;
use App\Models\Schedule;
use App\Models\Pet;
use Carbon\Carbon;

class SchedulesController extends Controller
{
    public function create(Request $request) {

        $this->validate($request, [
            'day' => 'required',
            'feedTime' => 'required',
            'amount' => 'required',
            'groupId' => 'required',
            'petId' => 'required',
            'deleted' => 'required',
            'uId' => 'required',
            'deviceId' => 'required',
            'serverId' => 'required'
        ]);

        $device = Device::where('deviceId', $request->deviceId)->first();
        $user = $device->user;
        $schedule = [];
        try{
            \DB::beginTransaction();
            if ($request->serverId == -1)
            {
                $schedule = Schedule::create([
                    'day' => $request->day,
                    'time' => Carbon::parse($request->time),
                    'user_id' => $user->id,
                    'pet_id' => $request->petId,
                    'amount' => $request->amount,
                    'device_id' => $device->id,
                    'uId' => $request->uId,
                    'groupId' => $request->groupId
                ]);
            } else {
                $schedule = Schedule::find($request->serverId);
                if ($request->deleted == true) {
                    $schedule->delete();
                } else {
                    $schedule->day = $request->day;
                    $schedule->time = Carbon::parse($request->time);
                    $schedule->amount = $request->amount;
                    $schedule->update();
                }
            }
            \DB::commit();
        } catch (\Exception $e) {
            \DB::rollback();
            abort(500, $e);
        }

        return response()->json($schedule, 200);
    }
}
