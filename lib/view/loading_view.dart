import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/strings.dart';
import '../providers/weather_provider.dart';
import 'weather/weather_view.dart';

class LoadingView extends StatelessWidget {
  static const routeName = '/';

  const LoadingView({Key? key}) : super(key: key);

  Future<Widget> futureCall(BuildContext context) async {
    await Provider.of<WeatherProvider>(context, listen: false).loadVariables();
    return Future.value(const WeatherView());
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/app_icon_circle.png'),
      logoSize: 90,
      title: const Text(
        WeatherStrings.appName,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      gradientBackground: LinearGradient(
        colors: [
          Colors.blue.shade200,
          Colors.orange.shade200,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      loadingText: const Text(
        WeatherStrings.loading,
      ),
      showLoader: true,
      futureNavigator: futureCall(context),
    );
  }
}
