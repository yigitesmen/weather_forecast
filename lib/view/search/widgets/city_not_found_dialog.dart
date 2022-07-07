import 'package:flutter/material.dart';

import '../../../constants/strings.dart';

class CityNotFoundDialog extends StatelessWidget {
  const CityNotFoundDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(WeatherStrings.cityNotFoundDialogTitle),
      content: const Text(WeatherStrings.cityNotFoundDialogContent),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            WeatherStrings.ok,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
