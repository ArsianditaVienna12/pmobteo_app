// services/favorites_service.dart

import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../models/dummy_data.dart';

class FavoritesService extends ChangeNotifier {
  static final FavoritesService _instance = FavoritesService._internal();
  factory FavoritesService() => _instance;
  FavoritesService._internal();

  final Set<String> _favoriteIds = {};

  List<Pet> getFavorites() {
    return dummyPets.where((pet) => _favoriteIds.contains(pet.id)).toList();
  }

  bool isFavorite(String petId) => _favoriteIds.contains(petId);

  void toggleFavorite(String petId) {
    if (_favoriteIds.contains(petId)) {
      _favoriteIds.remove(petId);
    } else {
      _favoriteIds.add(petId);
    }
    notifyListeners();
  }

  int get count => _favoriteIds.length;
}

final favoritesService = FavoritesService();
