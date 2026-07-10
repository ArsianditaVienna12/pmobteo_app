<?php

namespace Database\Seeders;

use App\Models\Pet;
use Illuminate\Database\Seeder;

class PetSeeder extends Seeder
{
    public function run(): void
    {
        $pets = [
            [
                'name' => 'Milo',
                'breed' => 'Golden Retriever',
                'age' => '1 th',
                'gender' => 'Jantan',
                'type' => 'Anjing',
                'status' => 'Tersedia',
                'trait' => 'Ramah',
                'image_url' => 'https://placedog.net/600x600?id=15',
            ],
            [
                'name' => 'Luna',
                'breed' => 'Anggora Mix',
                'age' => '8 bln',
                'gender' => 'Betina',
                'type' => 'Kucing',
                'status' => 'Tersedia',
                'trait' => 'Manja',
                'image_url' => 'https://cataas.com/cat?width=600&height=600&r=1',
            ],
            [
                'name' => 'Bruno',
                'breed' => 'Kampung',
                'age' => '2 th',
                'gender' => 'Jantan',
                'type' => 'Anjing',
                'status' => 'Diadopsi',
                'trait' => 'Aktif',
                'image_url' => 'https://placedog.net/600x601?id=22',
            ],
            [
                'name' => 'Coco',
                'breed' => 'Domestic Shorthair',
                'age' => '6 bln',
                'gender' => 'Betina',
                'type' => 'Kucing',
                'status' => 'Tersedia',
                'trait' => 'Pendiam',
                'image_url' => 'https://cataas.com/cat?width=601&height=600&r=2',
            ],
            [
                'name' => 'Max',
                'breed' => 'Beagle',
                'age' => '3 th',
                'gender' => 'Jantan',
                'type' => 'Anjing',
                'status' => 'Tersedia',
                'trait' => 'Suka bermain',
                'image_url' => 'https://placedog.net/601x600?id=31',
            ],
            [
                'name' => 'Nala',
                'breed' => 'Persia Mix',
                'age' => '1.5 th',
                'gender' => 'Betina',
                'type' => 'Kucing',
                'status' => 'Diadopsi',
                'trait' => 'Penyayang',
                'image_url' => 'https://cataas.com/cat?width=602&height=602&r=3',
            ],
        ];

        foreach ($pets as $pet) {
            Pet::create($pet);
        }
    }
}