import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/search_view_model.dart';
import '../../constants/strings.dart';

class SearchView extends StatelessWidget {
  static const routeName = '/search-view';

  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => SearchViewModel(context),
      builder: (context, widget) => Scaffold(
        appBar: AppBar(title: const Text(WeatherStrings.search)),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 8,
          ),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: WeatherStrings.searchTextFieldLabelText,
            ),
            onSubmitted: (cityName) => Provider.of<SearchViewModel>(context, listen: false).getWeatherData(cityName),
          ),
        ),
      ),
    );
  }
}
