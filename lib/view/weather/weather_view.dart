import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/favorite_city.dart';
import '../../models/weather.dart';
import '../../providers/favorite_city_provider.dart';
import '../../providers/weather_provider.dart';
import '../../constants/strings.dart';
import 'widgets/weather_popup_menu_button.dart';
import '../../view_model/weather_view_model.dart';
import 'widgets/daily_weather_forecast_item.dart';
import 'widgets/humidity_pressure_wind_speed_row.dart';
import 'widgets/icon_temp_main_circle.dart';
import 'widgets/sunrise_sunset_row.dart';

class WeatherView extends StatelessWidget {
  static const routeName = '/weather-view';

  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Weather> weatherList = Provider.of<WeatherProvider>(context).weatherList;
    return Provider<WeatherViewModel>(
      create: (context) => WeatherViewModel(context),
      builder: (context, widget) => Scaffold(
        appBar: buildAppBar(context, weatherList.first),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(6),
                child: buildDate(weatherList.first.date),
              ),
              IconTempMainCircle(weather: weatherList.first),
              const SizedBox(height: 16),
              HumidityPressureWindSpeedRow(weather: weatherList.first),
              const Divider(thickness: 2, height: 24),
              SunriseSunsetRow(weather: weatherList.first),
              const Text(
                WeatherStrings.thisWeek,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 6),
              Expanded(
                child: buildDailyWeatherListView(context, weatherList),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, Weather weather) {
    var weatherViewModel = Provider.of<WeatherViewModel>(context, listen: false);
    return AppBar(
      leading: IconButton(
        icon: Consumer<FavoriteCityProvider>(
          builder: (context, weatherViewModel, widget) {
            int index = weatherViewModel.indexOf(FavoriteCity.fromWeather(weather));
            return Icon(
              index < 0 ? Icons.favorite_border : Icons.favorite,
              color: index < 0 ? Theme.of(context).colorScheme.onPrimary : Colors.red,
            );
          },
        ),
        onPressed: () => weatherViewModel.onFavoriteIconButtonPressed(weather),
      ),
      title: Text(weatherViewModel.appBarTitle(weather)),
      actions: [
        IconButton(
          onPressed: () => weatherViewModel.onSearchIconButtonPressed(),
          icon: const Icon(Icons.search),
        ),
        const WeatherPopupMenuButton(),
      ],
    );
  }

  Widget buildDate(String date) => Text(
        date,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget buildDailyWeatherListView(
          context, List<Weather> weatherForecastList) =>
      Container(
        decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            )),
        child: ListView.builder(
          itemCount: weatherForecastList.length - 1,
          itemBuilder: (context, index) {
            return DailyWeatherForecastItem(
              weather: weatherForecastList[index + 1],
            );
          },
        ),
      );
}
