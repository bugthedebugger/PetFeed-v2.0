<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Pet;
use App\Models\Type;
use Auth;

class PetsController extends Controller
{
    public function create(Request $request) {
        $this->validate($request, [
            'type' => 'required',
            'name' => 'required',
            'age' => 'nullable',
            'weight' => 'nullable'
        ]);

        $pet = [];
        try{
            $type = Type::where('name', $request->type)->first();
            $name = $request->name;
            $age = $request->age;
            $weight = $request->weight;

            \DB::beginTransaction();;
            $pet = Pet::create([
                'name' => $name,
                'type_id' => $type->id,
                'age' => $age,
                'weight' => $weight,
                'user_id' => Auth::user()->id,
            ]);
            \DB::commit();
        } catch (\Exception $e) {
            \DB::rollback();
            abort(500, $e);
        }

        return response()->json([
            'status' => 'success',
            'message' => 'Pet information saved',
            'pet_id' => $pet->id,
            'pet_name' => $pet->name,
            'pet_age' => $pet->age,
            'pet_weight' => $pet->weight,
            'pet_type' => $pet->type->name
        ]);

    }
}
