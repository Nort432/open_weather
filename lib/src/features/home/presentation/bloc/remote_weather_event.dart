part of 'remote_weather_bloc.dart';

abstract class RemoteWeatherEvent extends Equatable {
  const RemoteWeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeatherEvent extends RemoteWeatherEvent {
  const FetchWeatherEvent();
}

class PressCardDayEvent extends RemoteWeatherEvent {
  const PressCardDayEvent(this.dayEntity);

  final DayEntity dayEntity;

  @override
  List<Object> get props => [dayEntity];
}

class ChoiceModeEvent extends RemoteWeatherEvent {
  const ChoiceModeEvent(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}