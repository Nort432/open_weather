import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather/src/features/home/domain/entities/weather_entity.dart';
import 'package:open_weather/src/features/home/presentation/cubit/day_expanded_cubit.dart';
import 'package:open_weather/src/features/home/presentation/widgets/card_day_widget.dart';

import '../../../../config/app_widgets/app_bars/my_app_bar.dart';
import '../../domain/entities/forecast_day_entity.dart';

class HomeScaffoldWidget extends StatelessWidget {
  const HomeScaffoldWidget({Key? key, required this.weatherEntity})
      : super(key: key);

  final WeatherEntity weatherEntity;

  @override
  Widget build(BuildContext context) {
    List<ForecastDayEntity> days = weatherEntity.forecast.forecastDay;
print('sdfdsfdsf');
    return Scaffold(
      appBar: MyAppBar().init(),
      body: BlocProvider(
        create: (_) => DayExpandedCubit(),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: days.length,
              itemBuilder: (context, index) {
                return CardDayWidget(
                    index: index,
                    location: weatherEntity.location,
                    day: days[index].day);
              }),
        ),
      ),
    );
  }
}
