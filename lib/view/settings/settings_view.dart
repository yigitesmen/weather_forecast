import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/view/settings/widgets/measurement_button.dart';

import '../../view_model/settings_view_model.dart';
import '../../constants/strings.dart';
import 'widgets/save_button.dart';

class SettingsView extends StatelessWidget {
  static const routeName = '/settings-view';

  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsViewModel(context),
      builder: (context, settingsViewModel) {
        return Scaffold(
          appBar: AppBar(title: const Text(WeatherStrings.settings)),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTitle(context),
                const SizedBox(height: 16),
                Consumer<SettingsViewModel>(
                  builder: (context, settingsViewModel, widget) =>
                      MeasurementButton(
                    onTap: settingsViewModel.changeMeasurementUnit,
                    text: settingsViewModel.measurementUnit.toString(),
                  ),
                ),
                const SizedBox(height: 8),
                SaveButton(
                  onPressed: Provider.of<SettingsViewModel>(context, listen: false)
                      .saveMeasurementUnit,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildTitle(BuildContext context) {
    return Text(
      WeatherStrings.changeUnitsOfMeasurement,
      style: Theme.of(context).textTheme.headline6,
    );
  }
}
