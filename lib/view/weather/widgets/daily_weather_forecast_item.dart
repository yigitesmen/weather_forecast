import 'package:flutter/material.dart';

import '../../../constants/styles.dart';
import '../../../models/weather.dart';

class DailyWeatherForecastItem extends StatelessWidget {
  final Weather weather;

  const DailyWeatherForecastItem({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: WeatherStyles.borderRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildWeekDayAndIcon(),
          buildDescriptionText(context),
          buildMinAndMaxTempText(context),
        ],
      ),
    );
  }

  Row buildWeekDayAndIcon() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 30,
          child: Text(weather.weekDay),
        ),
        const SizedBox(width: 36),
        Image.network(
          'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
          width: 60,
          height: 60,
        ),
      ],
    );
  }

  Container buildDescriptionText(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(28)),
      ),
      child: Text(weather.description),
    );
  }

  Widget buildMinAndMaxTempText(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            text: '${weather.minTemp}° ',
          ),
          TextSpan(
            text: '${weather.maxTemp}°',
          ),
        ],
      ),
    );
  }
}
