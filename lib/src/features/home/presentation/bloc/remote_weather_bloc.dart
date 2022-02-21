import 'dart:async';

import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_weather/src/core/params/weather_params.dart';
import 'package:open_weather/src/features/home/domain/entities/weather_entity.dart';
import 'package:open_weather/src/features/home/domain/usecases/fetch_weather_usecase.dart';

import '../../../../core/resources/data_state.dart';

part 'remote_weather_event.dart';

part 'remote_weather_state.dart';

class RemoteWeatherBloc extends Bloc<RemoteWeatherEvent, RemoteWeatherState> {
  RemoteWeatherBloc({required this.fetchWeatherUseCase})
      : super(const RemoteWeatherLoading()) {
    on<RemoteWeatherEvent>(_onFetchWeather);
  }

  final FetchWeatherUseCase fetchWeatherUseCase;
  late final WeatherEntity weatherEntity;

  Future<void> _onFetchWeather(
      RemoteWeatherEvent event, Emitter<RemoteWeatherState> emit) async {
    final DataState dataState = await fetchWeatherUseCase(WeatherParams());

    if (dataState is DataSuccess && dataState.data != null) {
      weatherEntity = dataState.data as WeatherEntity;

      return emit(RemoteWeatherDone(weatherEntity));
    }

    if (dataState is DataFailed) {
      if (dataState.error != null) {
        return emit(RemoteWeatherError(dataState.error!));
      }
    }
  }
}
