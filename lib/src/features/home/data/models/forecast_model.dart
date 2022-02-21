import 'package:open_weather/src/features/home/domain/entities/forecast_entity.dart';

import 'forecast_day_model.dart';

class ForecastModel extends ForecastEntity {
  const ForecastModel({required List<ForecastDayModel> forecastDay})
      : super(forecastDay: forecastDay);

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
        forecastDay: List.from(json['forecastday'])
            .map((e) => ForecastDayModel.fromJson(e))
            .toList());
  }
}
