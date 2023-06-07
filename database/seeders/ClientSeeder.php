<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Client;

class ClientSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $clients = [
            [
                'client_name' => 'NEC',
                'client_address' => 'Jakarta',
            ],
            [
                'client_name' => 'TAM',
                'client_address' => 'Jakarta',
            ],
            [
                'client_name' => 'TUA',
                'client_address' => 'Bandung',
            ],
        ];

        foreach ($clients as $clientData) {
            Client::create($clientData);
        }
    }
}