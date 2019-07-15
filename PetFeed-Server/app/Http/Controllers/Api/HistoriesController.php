<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\History;
use Carbon\Carbon;

class HistoriesController extends Controller
{
    public function createOrUpdate(Request $request) {
        $this->validate($request, [
            'feedingDate' => 'required',
            'amount' => 'required'
        ]);

        $history = [];

        try {
            \DB::beginTransaction();
            $history = History::Create([
                'feedingDate' => Carbon::parse($request->feedingDate),
                'amount' => $request->amount,
                'schedule_uid' => ($request->schedule_uid === 'None')? null: $request->schedule_uid,
            ]);
            \DB::commit();
        } catch (\Exception $e) {
            \DB::rollback();
            abort(500, $e);
        }

        return response()->json($history, 200);
    }
}
