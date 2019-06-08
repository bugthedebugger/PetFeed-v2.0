<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\History;

class HistoriesController extends Controller
{
    public function createOrUpate(Request $request) {
        $this->validate($request, [
            'feedingDate' => 'required',
            'amount' => 'required'
        ]);

        $history = [];

        try {
            \DB::beginTransaction();
            $history = History::Create([
                'feedingDate' => $request->feedingDate,
                'amount' => $request->amount,
                'schedule_uid' =>
                    $request->has('schedule_uid')? $request->schedule_uid: null,
            ]);
            \DB::commit();
        } catch (\Exception $e) {
            \DB::rollback();
            abort(500, $e);
        }

        return response()->json($history, 200);
    }
}
