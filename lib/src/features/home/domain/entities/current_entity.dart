import 'package:equatable/equatable.dart';

import 'condition_entity.dart';

class CurrentEntity extends Equatable {
  const CurrentEntity({
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.condition,
    required this.windKph,
    required this.precipitateMm,
    required this.humidity,
  });
   final String lastUpdated;
   final double tempC;
   final double tempF;
   final ConditionEntity condition;
   final double windKph;
   final double precipitateMm;
   final int humidity;

  @override
  List<Object?> get props => [lastUpdated, tempC, tempF, condition, windKph, precipitateMm, humidity];

  @override
  bool get stringify => true;
}