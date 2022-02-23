import 'package:open_weather/src/features/home/domain/entities/day_entity.dart';

import 'condition_model.dart';

class DayModel extends DayEntity {
  DayModel(
      {required double tempC,
      required double tempF,
      required double windKph,
      required double precipitateMm,
      required double humidity,
      required ConditionModel condition})
      : super(
            tempC: tempC,
            tempF: tempF,
            windKph: windKph,
            precipitateMm: precipitateMm,
            humidity: humidity,
            condition: condition);

  factory DayModel.fromJson(Map<String, dynamic> json) {
    return DayModel(
        tempC: json['avgtemp_c'],
        tempF: json['avgtemp_f'],
        windKph: json['maxwind_kph'],
        precipitateMm: json['totalprecip_mm'],
        humidity: json['avghumidity'],
        condition: ConditionModel.fromJson(json['condition']));
  }
}
