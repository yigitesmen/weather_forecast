import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/strings.dart';
import 'providers/favorite_city_provider.dart';
import 'providers/weather_provider.dart';
import 'navigation/route_generator.dart';
import 'theme/weather_theme_data.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherProvider>(
          create: (context) => WeatherProvider(),
        ),
        ChangeNotifierProvider<FavoriteCityProvider>(
          create: (context) => FavoriteCityProvider(),
        ),
      ],
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: WeatherStrings.appName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      themeMode: ThemeMode.system,
      theme: WeatherThemeData.lightTheme,
      darkTheme: WeatherThemeData.darkTheme,
    );
  }
}
