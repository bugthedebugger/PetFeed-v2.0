<?php

use Illuminate\Database\Seeder;
use App\User;
use Carbon\Carbon;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'name' => 'PetFeed Admin',
            'email' => 'petfeed@gmail.com',
            'password' => bcrypt('petfeedpassword'),
            'email_verified_at' => Carbon::now(),
            'admin' => true
        ]);
    }
}
