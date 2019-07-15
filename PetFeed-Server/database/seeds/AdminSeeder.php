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
        $user = User::create([
            'name' => 'PetFeed Admin',
            'email' => 'petfeed@gmail.com',
            'password' => bcrypt('petfeedpassword'),
            'admin' => true
        ]);

        $user->markEmailAsVerified();
    }
}
