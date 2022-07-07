import 'package:flutter/material.dart';

class MeasurementButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const MeasurementButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 140,
        height: 40,
        color: Theme.of(context).colorScheme.surface,
        child: Text(text),
      ),
    );
  }
}
