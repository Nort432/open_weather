import 'package:open_weather/src/features/home/data/models/day_model.dart';
import 'package:open_weather/src/features/home/domain/entities/forecast_day_entity.dart';

import 'hour_model.dart';

class ForecastDayModel extends ForecastDayEntity {
  const ForecastDayModel(
      {required String date,
      required DayModel day,
      required List<HourModel> hour})
      : super(date: date, day: day, hours: hour);

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) {
    return ForecastDayModel(
        date: json['date'],
        day: DayModel.fromJson(json['day']),
        hour:
            List.from(json['hour']).map((e) => HourModel.fromJson(e)).toList()
    );
  }
}
