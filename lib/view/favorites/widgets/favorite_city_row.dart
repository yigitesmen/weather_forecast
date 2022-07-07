import 'package:flutter/material.dart';

import '../../../models/favorite_city.dart';
import '../../../constants/styles.dart';

class FavoriteCityRow extends StatelessWidget {
  final FavoriteCity favoriteCity;
  final VoidCallback onRowTap;
  final VoidCallback onDeleteIconButtonPressed;

  const FavoriteCityRow({
    Key? key,
    required this.favoriteCity,
    required this.onRowTap,
    required this.onDeleteIconButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: WeatherStyles.borderRadius,
      ),
      child: InkWell(
        onTap: onRowTap,
        child: Row(
          children: [
            Expanded(
              flex: 11,
              child: buildFavoriteCityNameText(context),
            ),
            Expanded(
              flex: 9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCountryCodeWidget(context),
                  buildDeleteFavoriteCityButton(),
                  const SizedBox(width: 10)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconButton buildDeleteFavoriteCityButton() {
    return IconButton(
      onPressed: onDeleteIconButtonPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: const Icon(Icons.restore_from_trash),
    );
  }

  Widget buildCountryCodeWidget(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(28)),
      ),
      child: Text(
        favoriteCity.countryCode,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }

  Text buildFavoriteCityNameText(BuildContext context) {
    return Text(
      favoriteCity.cityName,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
