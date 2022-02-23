import 'dart:async';

import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_weather/src/core/params/weather_params.dart';
import 'package:open_weather/src/features/home/domain/entities/day_entity.dart';
import 'package:open_weather/src/features/home/domain/entities/mode_entity.dart';
import 'package:open_weather/src/features/home/domain/entities/weather_entity.dart';
import 'package:open_weather/src/features/home/domain/usecases/fetch_weather_usecase.dart';

import '../../../../core/resources/data_state.dart';

part 'remote_weather_event.dart';

part 'remote_weather_state.dart';

class RemoteWeatherBloc extends Bloc<RemoteWeatherEvent, RemoteWeatherState> {
  RemoteWeatherBloc({required this.fetchWeatherUseCase})
      : super(const RemoteWeatherLoading()) {
    on<FetchWeatherEvent>(_onFetchWeather);
    on<PressCardDayEvent>(_onPressCardDay);
    on<ChoiceModeEvent>(_onChoiceMode);
  }

  final FetchWeatherUseCase fetchWeatherUseCase;
  late final WeatherEntity weatherEntity;
  // late final Position position;

  Future<void> _onFetchWeather(
      RemoteWeatherEvent event, Emitter<RemoteWeatherState> emit) async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // Написал этот код, ибо мало времени осталось;
    //
    WeatherParams param;
    if(placemarks.length > 1){
       param = WeatherParams()
          .copyWith(
          city: placemarks[4].locality == 'Kyiv'
              ? 'Kiev'
              : placemarks[4].locality);
    } else {
      param = WeatherParams();
    }

    final DataState dataState = await fetchWeatherUseCase(param);
    // print(placemarks[4].locality);

    if (dataState is DataSuccess && dataState.data != null) {
      weatherEntity = dataState.data as WeatherEntity;

      return emit(RemoteWeatherDone(weatherEntity: weatherEntity));
    }

    if (dataState is DataFailed) {
      if (dataState.error != null) {
        return emit(RemoteWeatherError(dataState.error!));
      }
    }
  }

  FutureOr<void> _onPressCardDay(
      PressCardDayEvent event, Emitter<RemoteWeatherState> emit) async {
    final currentState = state;

    emit(const RemoteWeatherLoading());

    if (currentState is RemoteWeatherDone) {
      WeatherEntity newWeather = currentState.weatherEntity;

      for (var e in newWeather.forecast.forecastDay) {
        if (e.day == event.dayEntity) {
          e.day.isPressed = !event.dayEntity.isPressed;
          break;
        }
      }

      return emit(RemoteWeatherDone(weatherEntity: newWeather));
    }
  }

  FutureOr<void> _onChoiceMode(
      ChoiceModeEvent event, Emitter<RemoteWeatherState> emit) async {
    final currentState = state;

    emit(const RemoteWeatherLoading());

    if (currentState is RemoteWeatherDone) {
      List<String> items = ModeEntity().items;

      if (event.name == items.first) {
        return emit(RemoteWeatherDone(
            weatherEntity: currentState.weatherEntity, isShowDays: true));
      }

      if (event.name == items[1]) {
        return emit(RemoteWeatherDone(
            weatherEntity: currentState.weatherEntity, isShowDays: false));
      }
    }
  }
}
