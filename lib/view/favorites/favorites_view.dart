import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/favorites_view_model.dart';
import 'widgets/favorite_city_row.dart';
import '../../providers/favorite_city_provider.dart';
import '../../constants/strings.dart';

class FavoritesView extends StatelessWidget {
  static const routeName = '/favorites-view';

  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => FavoritesViewModel(context),
      builder: (context, widget) => Scaffold(
        appBar: AppBar(title: const Text(WeatherStrings.favoriteCities)),
        body: Consumer<FavoriteCityProvider>(
          builder: (context, favoriteCityProvider, widget) {
            return buildListView(favoriteCityProvider);
          },
        ),
      ),
    );
  }

  ListView buildListView(FavoriteCityProvider favoriteCityProvider) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: favoriteCityProvider.favoriteCityList.length,
      primary: false,
      itemBuilder: (context, index) {
        var favoriteCity = favoriteCityProvider.favoriteCityList[index];
        return FavoriteCityRow(
          favoriteCity: favoriteCity,
          onRowTap: () =>
              Provider.of<FavoritesViewModel>(context, listen: false)
                  .getWeatherData(favoriteCity.cityName),
          onDeleteIconButtonPressed: () =>
              favoriteCityProvider.deleteFavoriteCity(index),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 4),
    );
  }
}
