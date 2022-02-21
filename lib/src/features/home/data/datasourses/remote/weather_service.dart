import 'package:flutter/material.dart';
import 'package:open_weather/src/config/app_apis/app_api.dart';
import 'package:open_weather/src/features/home/data/models/weather_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'weather_service.g.dart';

@RestApi(baseUrl: AppApi.baseUrl)
abstract class WeatherService {
  factory WeatherService(Dio dio, {String baseUrl}) = _WeatherService;

  @GET(AppApi.weatherUrl)
  Future<HttpResponse<WeatherModel>> fetchWeatherService({
  @Query(AppApi.paramApiKeyName) required String apiKey,
  @Query(AppApi.paramCityName) required String city,
  @Query(AppApi.paramDaysName) required String day,
});
}
