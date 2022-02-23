import 'package:equatable/equatable.dart';
import 'package:open_weather/src/features/home/domain/entities/condition_entity.dart';

class DayEntity extends Equatable {
   DayEntity(
      {required this.tempC,
      required this.tempF,
      required this.windKph,
      required this.precipitateMm,
      required this.humidity,
      required this.condition,
      this.isPressed = false});

  final double tempC;
  final double tempF;
  final double windKph;
  final double precipitateMm;
  final double humidity;
  final ConditionEntity condition;
  bool isPressed;

   DayEntity copyWith(
      {final double? tempC,
      final double? tempF,
      final double? windKph,
      final double? precipitateMm,
      final double? humidity,
      final ConditionEntity? condition,
      required bool isPressed}){
     return DayEntity(
         tempC: tempC ?? this.tempC,
         tempF: tempF ?? this.tempF,
         windKph: windKph ?? this.windKph,
         precipitateMm: precipitateMm ?? this.precipitateMm,
         humidity: humidity ?? this.humidity,
         condition: condition ?? this.condition,
         isPressed: isPressed
     );
   }

  @override
  List<Object?> get props =>
      [tempC, tempF, windKph, precipitateMm, humidity, condition, isPressed];

  @override
  bool get stringify => true;
}
