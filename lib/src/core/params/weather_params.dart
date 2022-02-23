import 'package:open_weather/src/config/app_apis/app_api.dart';

import '../../config/app_consts/app_consts.dart';

class WeatherParams {
  final String apiKey;
  final String city;
  final String days;

  WeatherParams({
    this.apiKey = AppApi.apiKey,
    this.city = AppApi.defaultCity,
    this.days = AppApi.defaultDays
  });

  WeatherParams copyWith({
    final String? apiKey,
    final String? city,
    final String? days,

  }) {
    return WeatherParams(
      apiKey: apiKey ?? this.apiKey,
      city: city ?? this.city,
      days: days ?? this.days
    );
  }
}