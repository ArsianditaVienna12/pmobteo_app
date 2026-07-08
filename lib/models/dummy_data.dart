// models/dummy_data.dart

import 'pet.dart';

const List<Pet> dummyPets = [
  Pet(
    id: '1',
    name: 'Milo',
    breed: 'Golden Retriever',
    age: '1 th',
    gender: 'Jantan',
    type: 'Anjing',
    status: 'Tersedia',
    trait: 'Ramah',
    imageUrl: 'https://placedog.net/600x600?id=15',
  ),
  Pet(
    id: '2',
    name: 'Luna',
    breed: 'Anggora Mix',
    age: '8 bln',
    gender: 'Betina',
    type: 'Kucing',
    status: 'Tersedia',
    trait: 'Manja',
    imageUrl: 'https://cataas.com/cat?width=600&height=600&r=1',
  ),
  Pet(
    id: '3',
    name: 'Bruno',
    breed: 'Kampung',
    age: '2 th',
    gender: 'Jantan',
    type: 'Anjing',
    status: 'Diadopsi',
    trait: 'Aktif',
    imageUrl: 'https://placedog.net/600x601?id=22',
  ),
  Pet(
    id: '4',
    name: 'Coco',
    breed: 'Domestic Shorthair',
    age: '6 bln',
    gender: 'Betina',
    type: 'Kucing',
    status: 'Tersedia',
    trait: 'Pendiam',
    imageUrl: 'https://cataas.com/cat?width=601&height=600&r=2',
  ),
  Pet(
    id: '5',
    name: 'Max',
    breed: 'Beagle',
    age: '3 th',
    gender: 'Jantan',
    type: 'Anjing',
    status: 'Tersedia',
    trait: 'Suka bermain',
    imageUrl: 'https://placedog.net/601x600?id=31',
  ),
  Pet(
    id: '6',
    name: 'Nala',
    breed: 'Persia Mix',
    age: '1.5 th',
    gender: 'Betina',
    type: 'Kucing',
    status: 'Diadopsi',
    trait: 'Penyayang',
    imageUrl: 'https://cataas.com/cat?width=602&height=602&r=3',
  ),
];

const List<String> categories = ['Semua', 'Kucing', 'Anjing'];
