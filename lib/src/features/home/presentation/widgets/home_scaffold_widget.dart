import 'package:flutter/material.dart';
import 'package:open_weather/src/features/home/domain/entities/weather_entity.dart';
import 'package:open_weather/src/features/home/presentation/widgets/gen_card_hour.dart';

import '../../../../config/app_widgets/app_bars/my_app_bar.dart';
import 'list_view_cards.dart';

class HomeScaffoldWidget extends StatelessWidget {
  const HomeScaffoldWidget({Key? key, required this.weatherEntity, required this.isShowDays})
      : super(key: key);

  final WeatherEntity weatherEntity;
  final bool isShowDays;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(context: context).init(),
        body: isShowDays == true
    ? GenCardDay(weatherEntity)
    : const GenCardHour());
  }
}
