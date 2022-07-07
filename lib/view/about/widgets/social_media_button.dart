import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;

  const SocialMediaButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        'assets/images/$icon',
        width: 32,
        height: 32,
      ),
    );
  }
}
