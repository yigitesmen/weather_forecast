import 'package:flutter/material.dart';

class WeatherThemeData {

  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.black,
      secondary: Colors.grey.shade900,
      onPrimary: Colors.black,
      surface: Colors.green,
    ),
    primaryColor: Colors.orange.shade300,
    primaryColorDark: Colors.orange,
    primaryColorLight: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.orange,
      centerTitle: true,
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.orange.shade900,
      secondary: Colors.grey.shade900,
      surface: Colors.green,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.grey.shade900,
      centerTitle: true,
    ),
  );

}