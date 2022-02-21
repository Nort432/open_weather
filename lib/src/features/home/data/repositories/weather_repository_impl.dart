import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/params/weather_params.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasourses/remote/weather_service.dart';
import '../models/weather_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  const WeatherRepositoryImpl(this._weatherService);
  final WeatherService _weatherService;

  @override
  Future<DataState<WeatherEntity>> fetchWeatherRepository(WeatherParams weatherParams) async {
    try {
      final httpResponse = await _weatherService.fetchWeatherService(
        apiKey: weatherParams.apiKey,
        city: weatherParams.city,
        day: weatherParams.days
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        WeatherModel weatherModel = httpResponse.data;
        return DataSuccess(weatherModel);
      }

      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      print(e);
      print(StackTrace.current);
      return DataFailed(e);
    }
  }
}