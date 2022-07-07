import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/measurement_unit.dart';
import '../models/weather.dart';
import '../services/database.dart';
import '../util/epoch_converter.dart';

class WeatherProvider with ChangeNotifier {
  final Database _database = Database();
  late String _apiKey;
  late String _cityName;
  late MeasurementUnit _measurementUnit;
  List<Weather> _weatherList = [];

  Future<void> loadVariables() async {
    await FlutterConfig.loadEnvVariables();
    _apiKey = FlutterConfig.get('API_KEY');
    await Database.createDatabaseObject();
    _cityName = _database.readCityName();
    _measurementUnit = _database.readMeasurementUnit();
    await getDataFromApi(notify: false);
  }

  List<Weather> get weatherList => _weatherList;

  set cityName(String newCityName) {
    _database.updateCityName(newCityName);
    _cityName = newCityName;
  }

  set measurementUnit(MeasurementUnit measurementUnit) {
    _measurementUnit = measurementUnit;
  }

  Future<bool> getDataFromApi({bool notify = true}) async {
    String query = 'https://api.openweathermap.org/data/2.5/forecast/daily?q=$_cityName&appid=$_apiKey&units=${_measurementUnit.name}';
    var url = Uri.parse(query);
    var response = await http.get(url);
    var weatherDataParsed = jsonDecode(response.body);
    if (weatherDataParsed['cod'] == '404') return false;
    var list = weatherDataParsed['list'];
    _weatherList = List.generate(list.length, (index) {
      var dailyForecast = list[index];
      int timezone = weatherDataParsed['city']['timezone'];
      return Weather(
        id: weatherDataParsed['city']['id'],
        cityName: weatherDataParsed['city']['name'],
        countryCode: weatherDataParsed['city']['country'],
        date: EpochConverter.convertToDate((dailyForecast['dt'] + timezone) * 1000),
        weekDay: EpochConverter.convertToWeekday((dailyForecast['dt'] + timezone) * 1000),
        sunrise: EpochConverter.convertToTime((dailyForecast['sunrise'] + timezone) * 1000),
        sunset: EpochConverter.convertToTime((dailyForecast['sunset'] + timezone) * 1000),
        temp: dailyForecast['temp']['day'].round(),
        minTemp: dailyForecast['temp']['min'].round(),
        maxTemp: dailyForecast['temp']['max'].round(),
        humidity: dailyForecast['humidity'],
        pressure: dailyForecast['pressure'],
        windSpeed: dailyForecast['speed'].round(),
        main: dailyForecast['weather'][0]['main'],
        description: dailyForecast['weather'][0]['description'],
        icon: dailyForecast['weather'][0]['icon'],
      );
    });
    if (notify) notifyListeners();
    return true;
  }
}
