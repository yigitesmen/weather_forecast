import '../constants/strings.dart';

class MeasurementUnit {
  static const imperial = 'imperial';
  static const _mph = 'mph';
  static const metric = 'metric';
  static const _ms = 'm/s';

  String name;
  String unit = _mph;

  MeasurementUnit({required this.name}) {
    if (name == metric) unit = _ms;
  }

  void toggle() {
    name = (name == imperial) ? metric : imperial;
    unit = (unit == _mph) ? _ms : _mph;
  }

  @override
  String toString() {
    switch (name) {
      case MeasurementUnit.imperial:
        return '${WeatherStrings.fahrenheit} °C';
      default:
        return '${WeatherStrings.celsius} °C';
    }
  }
}
