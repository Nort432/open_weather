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
  const RemoteWeatherDone(this.weatherEntity);

  final WeatherEntity weatherEntity;

  @override
  List<Object> get props => [weatherEntity];
}

class RemoteWeatherError extends RemoteWeatherState {
  const RemoteWeatherError(this.error);
  final DioError error;

  @override
  List<Object> get props => [error];
}