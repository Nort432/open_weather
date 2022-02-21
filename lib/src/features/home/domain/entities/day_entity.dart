import 'package:equatable/equatable.dart';
import 'package:open_weather/src/features/home/domain/entities/condition_entity.dart';

class DayEntity extends Equatable {
  const DayEntity(
      {required this.tempC,
      required this.tempF,
      required this.windKph,
      required this.precipitateMm,
      required this.humidity,
      required this.condition});

  final double tempC;
  final double tempF;
  final double windKph;
  final double precipitateMm;
  final double humidity;
  final ConditionEntity condition;

  @override
  List<Object?> get props =>
      [tempC, tempF, windKph, precipitateMm, humidity, condition];

  @override
  bool get stringify => true;
}
