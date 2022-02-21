
import 'package:open_weather/src/core/params/weather_params.dart';
import 'package:open_weather/src/features/home/domain/entities/weather_entity.dart';

import '../../../../core/resources/data_state.dart';

abstract class WeatherRepository {
  Future<DataState<WeatherEntity>> fetchWeatherRepository(WeatherParams weatherParams);
}