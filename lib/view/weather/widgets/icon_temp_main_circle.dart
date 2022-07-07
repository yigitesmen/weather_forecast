import 'package:flutter/material.dart';

import '../../../models/weather.dart';

class IconTempMainCircle extends StatelessWidget {
  final Weather weather;

  const IconTempMainCircle({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 190,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      child: Column(
        children: [
          Image.network('https://openweathermap.org/img/wn/${weather.icon}@2x.png',
          ),
          Text(
            ' ${weather.temp}°',
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            weather.main,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
