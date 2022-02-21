import 'package:open_weather/src/features/home/data/models/condition_model.dart';
import 'package:open_weather/src/features/home/domain/entities/condition_entity.dart';
import 'package:open_weather/src/features/home/domain/entities/hour_entity.dart';

class HourModel extends HourEntity {
  const HourModel(
      {required String time,
      required double tempC,
      required double tempF,
      required ConditionEntity condition,
      required double windKph,
      required double precipitateMm,
      required int humidity})
      : super(
            time: time,
            tempC: tempC,
            tempF: tempF,
            condition: condition,
            windKph: windKph,
            precipitateMm: precipitateMm,
            humidity: humidity);

  factory HourModel.fromJson(Map<String, dynamic> json) {
    return HourModel(
        time: json['time'],
        tempC: json['temp_c'],
        tempF: json['temp_f'],
        condition: ConditionModel.fromJson(json['condition']),
        windKph: json['wind_kph'],
        precipitateMm: json['precip_mm'],
        humidity: json['humidity']);
  }
}
