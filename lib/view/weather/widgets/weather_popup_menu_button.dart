import 'package:flutter/material.dart';

import '../../../constants/strings.dart';
import '../../about/about_view.dart';
import '../../favorites/favorites_view.dart';
import '../../settings/settings_view.dart';

enum WeatherMenu { favorites, about, settings }

class WeatherPopupMenuButton extends StatelessWidget {
  const WeatherPopupMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (WeatherMenu weatherMenu) {
        switch (weatherMenu) {
          case WeatherMenu.favorites:
            Navigator.pushNamed(context, FavoritesView.routeName);
            break;
          case WeatherMenu.about:
            Navigator.pushNamed(context, AboutView.routeName);
            break;
          default:
            Navigator.pushNamed(context, SettingsView.routeName);
        }
      },
      itemBuilder: (context) =>
      <PopupMenuEntry<WeatherMenu>>[
        PopupMenuItem<WeatherMenu>(
          value: WeatherMenu.favorites,
          child: buildPopupMenuRow(
              context,
              iconData: Icons.favorite_border,
              text: WeatherStrings.favorites
          ),
        ),
        PopupMenuItem<WeatherMenu>(
          value: WeatherMenu.about,
          child: buildPopupMenuRow(
              context,
              iconData: Icons.info,
              text: WeatherStrings.about
          ),
        ),
        PopupMenuItem<WeatherMenu>(
          value: WeatherMenu.settings,
          child: buildPopupMenuRow(
              context,
              iconData: Icons.settings,
              text: WeatherStrings.settings
          ),
        ),
      ],
    );
  }

  Widget buildPopupMenuRow(context, {
    required IconData iconData,
    required String text,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData),
        const SizedBox(width: 16),
        Text(text),
      ],
    );
  }

}
