import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorite_city.dart';
import '../models/weather.dart';
import '../providers/favorite_city_provider.dart';
import '../view/search/search_view.dart';

class WeatherViewModel {
  final BuildContext context;

  WeatherViewModel(this.context);

  String appBarTitle(Weather weather) =>
      '${weather.cityName}${weather.countryCode == '' ? '' : ', ${weather.countryCode}'}';

  void onFavoriteIconButtonPressed(Weather weather) {
    var favoriteCityProvider = Provider.of<FavoriteCityProvider>(context, listen: false);
    int index = favoriteCityProvider.indexOf(FavoriteCity.fromWeather(weather));
    var favoriteCity = FavoriteCity.fromWeather(weather);
    if (index < 0) {
      favoriteCityProvider.addFavoriteCity(favoriteCity);
    } else {
      favoriteCityProvider.deleteFavoriteCity(index);
    }
  }

  void onSearchIconButtonPressed() {
    Navigator.pushNamed(context, SearchView.routeName);
  }
}
