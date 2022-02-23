import 'package:equatable/equatable.dart';
import 'package:open_weather/src/features/home/domain/entities/day_entity.dart';

import 'hour_entity.dart';

class ForecastDayEntity extends Equatable {
  const ForecastDayEntity({
    required this.date,
    required this.day,
    required this.hours,
  });
   final String date;
   final DayEntity day;
   final List<HourEntity> hours;

  ForecastDayEntity copyWith(
  final String? date,
  final DayEntity? day,
  final List<HourEntity>? hours,
  ) {
    return ForecastDayEntity(
    date: date ?? this.date,
        day: day ?? this.day,
        hours: hours ?? this.hours
    );
  }

  @override
  List<Object?> get props => [date, day, hours];

  @override
  bool get stringify => true;
}