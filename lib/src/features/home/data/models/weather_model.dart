import 'package:open_weather/src/features/home/data/models/forecast_model.dart';
import 'package:open_weather/src/features/home/domain/entities/weather_entity.dart';

import 'current_model.dart';
import 'location_model.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel(
      {required LocationModel location,
      required CurrentModel current,
      required ForecastModel forecast})
      : super(location: location, current: current, forecast: forecast);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        location: LocationModel.fromJson(json['location']),
        current: CurrentModel.fromJson(json['current']),
        forecast: ForecastModel.fromJson(json['forecast']));
  }
}
