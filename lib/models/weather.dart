class Weather {
  final int id;
  final String cityName;
  final String countryCode;
  final String date;
  final String weekDay;
  final String sunrise;
  final String sunset;
  final int temp;
  final int minTemp;
  final int maxTemp;
  final int humidity;
  final int pressure;
  final int windSpeed;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.cityName,
    required this.countryCode,
    required this.date,
    required this.weekDay,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.main,
    required this.description,
    required this.icon
  });
}
