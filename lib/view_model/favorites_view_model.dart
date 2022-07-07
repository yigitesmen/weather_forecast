import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';

class FavoritesViewModel {
  final BuildContext context;

  FavoritesViewModel(this.context);

  void getWeatherData(String cityName) {
    Navigator.pop(context);
    var weatherProvider = Provider.of<WeatherProvider>(context, listen: false);
    weatherProvider.cityName = cityName;
    weatherProvider.getDataFromApi();
  }
}