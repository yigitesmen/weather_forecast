import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/measurement_unit.dart';
import '../providers/weather_provider.dart';
import '../services/database.dart';

class SettingsViewModel with ChangeNotifier {
  BuildContext context;
  final Database _database = Database();
  late MeasurementUnit _measurementUnit;

  SettingsViewModel(this.context) {
    _initMeasurementUnit();
  }

  void _initMeasurementUnit() {
    _measurementUnit = _database.readMeasurementUnit();
  }

  MeasurementUnit get measurementUnit => _measurementUnit;

  void changeMeasurementUnit() {
    _measurementUnit.toggle();
    notifyListeners();
  }

  void saveMeasurementUnit() {
    _database.updateMeasurementUnit(_measurementUnit);
    Navigator.pop(context);
    var weatherProvider = Provider.of<WeatherProvider>(context, listen: false);
    weatherProvider.measurementUnit = _measurementUnit;
    weatherProvider.getDataFromApi();
  }

}
