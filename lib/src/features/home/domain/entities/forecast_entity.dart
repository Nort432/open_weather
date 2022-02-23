import 'package:equatable/equatable.dart';
import 'package:open_weather/src/features/home/domain/entities/forecast_day_entity.dart';

class ForecastEntity extends Equatable {
  const ForecastEntity({
    required this.forecastDay,
  });
   final List<ForecastDayEntity> forecastDay;

  ForecastEntity copyWith({
    final List<ForecastDayEntity>? forecastDay,
  }) {
    return ForecastEntity(
        forecastDay: forecastDay ?? this.forecastDay,
    );
  }

  @override
  List<Object?> get props => [forecastDay];

  @override
  bool get stringify => true;
}