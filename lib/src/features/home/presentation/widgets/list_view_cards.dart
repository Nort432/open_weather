import 'package:flutter/material.dart';

import '../../domain/entities/forecast_day_entity.dart';
import '../../domain/entities/location_entity.dart';
import '../../domain/entities/weather_entity.dart';
import 'gen_card_day.dart';

class GenCardDay extends StatelessWidget {
  GenCardDay(this.weather, {Key? key}) : super(key: key);

  late WeatherEntity weather;
  late LocationEntity location;

  @override
  Widget build(BuildContext context) {
    location = weather.location;
    List<ForecastDayEntity> days = weather.forecast.forecastDay;

    return SingleChildScrollView(
      child: Column(
        children: days.map((e) => _genCardDay(e)).toList(),
      ),
    );
  }

  Widget _genCardDay(ForecastDayEntity forecastDay) {
    return CardDayWidget(
      day: forecastDay.day,
      location: location,
    );
  }
}
