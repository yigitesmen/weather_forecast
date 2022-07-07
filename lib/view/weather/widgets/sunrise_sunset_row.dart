import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../../models/weather.dart';
import 'demonstrator.dart';

class SunriseSunsetRow extends StatelessWidget {
  final Weather weather;

  const SunriseSunsetRow({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Demonstrator(
          iconData: WeatherIcons.sunrise,
          text: weather.sunrise,
          gapBetweenIconAndText: 14,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 6),
          child: Demonstrator(
            iconData: WeatherIcons.sunset,
            text: weather.sunset,
            gapBetweenIconAndText: 8,
            textOnRightSide: false,
          ),
        ),
      ],
    );
  }
}
