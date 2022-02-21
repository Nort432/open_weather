import 'package:equatable/equatable.dart';
import 'package:open_weather/src/features/home/domain/entities/condition_entity.dart';

class HourEntity extends Equatable {
  const HourEntity({
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.condition,
    required this.windKph,
    required this.precipitateMm,
    required this.humidity,
  });

  final String time;
  final double tempC;
  final double tempF;
  final ConditionEntity condition;
  final double windKph;
  final double precipitateMm;
  final int humidity;

  @override
  List<Object?> get props =>
      [time, tempC, tempF, condition, windKph, precipitateMm, humidity];

  @override
  bool get stringify => true;
}