import 'package:open_weather/src/features/home/domain/entities/current_entity.dart';

import 'condition_model.dart';

class CurrentModel extends CurrentEntity {
  const CurrentModel({
    required String lastUpdated,
    required double tempC,
    required double tempF,
    required ConditionModel condition,
    required double windKph,
    required double precipitateMm,
    required int humidity})
      : super(
      lastUpdated: lastUpdated,
      tempC: tempC,
      tempF: tempF,
      condition: condition,
      windKph: windKph,
      precipitateMm: precipitateMm,
      humidity: humidity);

  factory CurrentModel.fromJson(Map<String, dynamic> json){
    return CurrentModel(
        lastUpdated: json['last_updated'],
        tempC: json['temp_c'],
        tempF: json['temp_f'],
        condition: ConditionModel.fromJson(json['condition']),
        windKph: json['wind_kph'],
        precipitateMm: json['precip_mm'],
        humidity: json['humidity']);
  }
}


