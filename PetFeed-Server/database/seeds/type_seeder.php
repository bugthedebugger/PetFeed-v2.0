<?php

use Illuminate\Database\Seeder;
use App\Models\Type;

class type_seeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        try{
            \DB::beginTransaction();
            Type::create([
                'name' => 'Dog'
            ]);
            Type::create([
                'name' => 'Fish'
            ]);
            Type::create([
                'name' => 'Cat'
            ]);
            \DB::commit();
        }catch(\Exception $e) {
            \DB::rollback();
        }
    }
}
