import 'package:flutter/material.dart';

import '../view/loading_view.dart';
import '../view/weather/weather_view.dart';
import '../view/search/search_view.dart';
import '../view/favorites/favorites_view.dart';
import '../view/about/about_view.dart';
import '../view/settings/settings_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case LoadingView.routeName:
        return MaterialPageRoute(builder: (context) => const LoadingView());
      case WeatherView.routeName:
        return MaterialPageRoute(builder: (context) => const WeatherView());
      case SearchView.routeName:
        return MaterialPageRoute(builder: (context) => const SearchView());
      case FavoritesView.routeName:
        return MaterialPageRoute(builder: (context) => const FavoritesView());
      case AboutView.routeName:
        return MaterialPageRoute(builder: (context) => const AboutView());
      case SettingsView.routeName:
        return MaterialPageRoute(builder: (context) => const SettingsView());
      default:
        throw(ArgumentError('Route ${routeSettings.name} is not recognized'));
    }
  }
}