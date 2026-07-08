// models/pet.dart

class Pet {
  final String id;
  final String name;
  final String breed;
  final String age;
  final String gender;
  final String type;
  final String status;
  final String trait;
  final String imageUrl;

  const Pet({
    required this.id,
    required this.name,
    required this.breed,
    required this.age,
    required this.gender,
    required this.type,
    required this.status,
    required this.trait,
    required this.imageUrl,
  });
}
