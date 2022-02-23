part of 'remote_weather_bloc.dart';

abstract class RemoteWeatherState extends Equatable {
  const RemoteWeatherState();
}

class RemoteWeatherLoading extends RemoteWeatherState {
  const RemoteWeatherLoading();

  @override
  List<Object> get props => [];
}

class RemoteWeatherDone extends RemoteWeatherState {
  const RemoteWeatherDone({required this.weatherEntity, this.isShowDays = true});

  final WeatherEntity weatherEntity;
  final bool isShowDays;

  @override
  List<Object?> get props => [weatherEntity, isShowDays];
}

class RemoteWeatherNothing extends RemoteWeatherState {
  const RemoteWeatherNothing(this.day);

  final DayEntity day;

  @override
  List<Object?> get props => [day];
}

class RemoteWeatherError extends RemoteWeatherState {
  const RemoteWeatherError(this.error);
  final DioError error;

  @override
  List<Object> get props => [error];
}