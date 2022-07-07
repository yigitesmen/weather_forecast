import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';
import '../view/search/widgets/city_not_found_dialog.dart';

class SearchViewModel {
  BuildContext context;

  SearchViewModel(this.context);

  void getWeatherData(String cityName) async {
    var weatherProvider = Provider.of<WeatherProvider>(context, listen: false);
    weatherProvider.cityName = cityName;
    bool result = await weatherProvider.getDataFromApi();
    if (result) {
      Navigator.of(context).pop();
    } else {
      _showCityNotFoundDialog();
    }
  }

  void _showCityNotFoundDialog() {
    showDialog(
      context: context,
      builder: (context) => const CityNotFoundDialog(),
    );
  }
}