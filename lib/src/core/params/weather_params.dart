import 'package:open_weather/src/config/app_apis/app_api.dart';

import '../../config/app_consts/app_consts.dart';

class WeatherParams {
  final String apiKey;
  String city;
  final String days;

  WeatherParams({
    this.apiKey = AppApi.apiKey,
    this.city = AppApi.defaultCity,
    this.days = AppApi.defaultDays
  });
}