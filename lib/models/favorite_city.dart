import 'dart:convert';

import 'weather.dart';

class FavoriteCity {
  final int id;
  final String cityName;
  final String countryCode;

  /// keys
  static const String _idKey = 'id';
  static const String _cityNameKey = 'city_name';
  static const String _countryCodeKey = 'country_code';

  FavoriteCity({
    required this.id,
    required this.cityName,
    required this.countryCode,
  });

  FavoriteCity.fromString(String str)
      : id = jsonDecode(str)[_idKey],
        cityName = jsonDecode(str)[_cityNameKey],
        countryCode = jsonDecode(str)[_countryCodeKey];

  FavoriteCity.fromWeather(Weather weather)
      : id = weather.id,
        cityName = weather.cityName,
        countryCode = weather.countryCode;

  @override
  toString() {
    return json.encode({
      _idKey: id,
      _cityNameKey: cityName,
      _countryCodeKey: countryCode,
    });
  }

}
