import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/providers/weather_provider.dart';
import 'package:weather_forecast/services/database.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../../models/weather.dart';
import 'demonstrator.dart';

class HumidityPressureWindSpeedRow extends StatelessWidget {
  final Weather weather;

  const HumidityPressureWindSpeedRow({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String unit = Database().readMeasurementUnit().unit;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Demonstrator(
          iconData: WeatherIcons.humidity,
          text: '${weather.humidity}%',
        ),
        Demonstrator(
          iconData: WeatherIcons.barometer,
          text: '${weather.pressure} psi',
        ),
        Demonstrator(
          iconData: WeatherIcons.strong_wind,
          text: '${weather.windSpeed} $unit',
          gapBetweenIconAndText: 8,
        ),
      ],
    );
  }
}
