import 'package:flutter/material.dart';

import '../../../constants/strings.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SaveButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text(
        WeatherStrings.save,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
