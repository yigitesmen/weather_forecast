import 'package:flutter/material.dart';

class Demonstrator extends StatelessWidget {
  final IconData iconData;
  final String text;
  final bool textOnRightSide;
  final double gapBetweenIconAndText;

  const Demonstrator({
    Key? key,
    required this.iconData,
    required this.text,
    this.textOnRightSide = true,
    this.gapBetweenIconAndText = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!textOnRightSide) Text(text),
        Padding(
          padding: EdgeInsets.only(
            bottom: 10,
            left: !textOnRightSide ? gapBetweenIconAndText : 0,
            right: textOnRightSide ? gapBetweenIconAndText : 0,
          ),
          child: Icon(
            iconData,
            size: 20,
          ),
        ),
        if (textOnRightSide) Text(text),
      ],
    );
  }
}
