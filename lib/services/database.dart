import 'package:shared_preferences/shared_preferences.dart';

import '../models/favorite_city.dart';
import '../models/measurement_unit.dart';

class Database {
  static late SharedPreferences _prefs;

  /// keys
  final String _cityNameKey = 'city_name';
  final String _measurementUnitKey = 'measurement_unit';
  final String _favoriteCityListKey = 'favorite_city_list';

  /// default values
  final String _defaultCityName = 'New York';
  final MeasurementUnit _defaultMeasurementUnit = MeasurementUnit(name: MeasurementUnit.imperial);
  final List<FavoriteCity> _defaultFavoriteCityList = [
    FavoriteCity(id: 5128581, cityName: 'New York', countryCode: 'US'),
    FavoriteCity(id: 5368361, cityName: 'Los Angeles', countryCode: 'US'),
    FavoriteCity(id: 745042, cityName: 'Istanbul', countryCode: 'TR'),
    FavoriteCity(id: 2643743, cityName: 'London', countryCode: 'GB'),
  ];

  static Future<void> createDatabaseObject() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String readCityName() => _prefs.getString(_cityNameKey) ?? _defaultCityName;

  void updateCityName(String newCityName) =>
      _prefs.setString(_cityNameKey, newCityName);

  MeasurementUnit readMeasurementUnit() {
    var measurementUnitName = _prefs.getString(_measurementUnitKey) ?? _defaultMeasurementUnit.name;
    switch (measurementUnitName) {
      case MeasurementUnit.imperial:
        return MeasurementUnit(name: MeasurementUnit.imperial);
      default:
        return MeasurementUnit(name: MeasurementUnit.metric);
    }
  }

  void updateMeasurementUnit(MeasurementUnit measurementUnit) =>
      _prefs.setString(_measurementUnitKey, measurementUnit.name);

  List<FavoriteCity> readFavoriteCities() {
    List<String>? favoriteCityAsStringList = _prefs.getStringList(_favoriteCityListKey);
    return favoriteCityAsStringList == null
        ? _defaultFavoriteCityList
        : List.generate(
            favoriteCityAsStringList.length,
            (index) => FavoriteCity.fromString(
              favoriteCityAsStringList[index],
            ),
          );
  }

  void updateFavoriteCityList(List<FavoriteCity> favoriteCityList) {
    List<String> favoriteCityAsStringList = List.generate(
      favoriteCityList.length,
          (index) => favoriteCityList[index].toString(),
    );
    _prefs.setStringList(_favoriteCityListKey, favoriteCityAsStringList);
  }

  void addFavoriteCity(FavoriteCity favoriteCity) {
    var favoriteCityList = readFavoriteCities();
    favoriteCityList.add(favoriteCity);
    updateFavoriteCityList(favoriteCityList);
  }

  void removeFavoriteCity(int index) {
    var favoriteCityList = readFavoriteCities();
    favoriteCityList.removeAt(index);
    updateFavoriteCityList(favoriteCityList);
  }
}
