import 'package:flutter/material.dart';

import '../../models/favorite_city.dart';
import '../services/database.dart';

class FavoriteCityProvider with ChangeNotifier {
  final Database _database = Database();

  FavoriteCityProvider();

  List<FavoriteCity> get favoriteCityList => _database.readFavoriteCities();

  void addFavoriteCity(FavoriteCity favoriteCity) {
    _database.addFavoriteCity(favoriteCity);
    notifyListeners();
  }

  void deleteFavoriteCity(int index) {
    _database.removeFavoriteCity(index);
    notifyListeners();
  }

  int indexOf(FavoriteCity favoriteCity) {
    for (int i = 0; i < favoriteCityList.length; i++) {
      if (favoriteCity.id == favoriteCityList[i].id) {
        return i;
      }
    }
    return -1;
  }

}
