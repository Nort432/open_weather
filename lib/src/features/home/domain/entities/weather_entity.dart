import 'package:equatable/equatable.dart';
import 'package:open_weather/src/features/home/domain/entities/current_entity.dart';
import 'package:open_weather/src/features/home/domain/entities/location_entity.dart';

import '../../data/models/location_model.dart';
import 'forecast_entity.dart';

class WeatherEntity extends Equatable {
  const WeatherEntity({
    required this.location,
    required this.current,
    required this.forecast,
  });
   final LocationEntity location;
   final CurrentEntity current;
   final ForecastEntity forecast;

  @override
  List<Object?> get props => [location, current, forecast];

  @override
  bool get stringify => true;
}











