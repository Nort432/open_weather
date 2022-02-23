import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather/src/config/app_apis/app_api.dart';
import 'package:open_weather/src/features/home/domain/entities/day_entity.dart';
import 'package:open_weather/src/features/home/domain/entities/location_entity.dart';
import 'package:open_weather/src/features/home/presentation/bloc/remote_weather_bloc.dart';

import '../../../../config/app_colors/app_colors.dart';
import '../../../../config/app_consts/app_consts.dart';
import '../../../../config/app_languages/app_languages.dart';
import '../../../../config/app_sizes/app_sizes.dart';
import '../../../../config/app_widgets/texts/my_text_celsius.dart';
import '../../../../config/app_widgets/texts/my_text_translate.dart';

class CardDayWidget extends StatelessWidget {
  const CardDayWidget({
    Key? key,
    required this.day,
    required this.location,
  }) : super(key: key);

  final DayEntity day;
  final LocationEntity location;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        context.read<RemoteWeatherBloc>().add(PressCardDayEvent(day));
      },
      animationDuration: kDurationSec2,
      children: [
        ExpansionPanel(
          isExpanded: day.isPressed,
          backgroundColor: AppColors.containerCardDay,
          headerBuilder: (context, isExpanded) {
            return Container(
              padding: AppSizes.containerPaddingCarDay,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextCelsius(tempC: day.tempC),
                      Image.network('${AppApi.https}${day.condition.icon}'),
                    ],
                  ),
                  MyTextTranslate(location.name),
                  MyTextTranslate(location.country),
                ],
              ),
            );
          },
          body: Container(
            padding: AppSizes.containerBottomPaddingCarDay,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLanguages.fahrenheit, style: AppSizes.textMiddle),
                    Text(day.tempF.toString(), style: AppSizes.textMiddle),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLanguages.wind, style: AppSizes.textMiddle),
                    Text('${day.windKph} ${AppLanguages.km}',
                        style: AppSizes.textMiddle),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLanguages.humidity, style: AppSizes.textMiddle),
                    Text('${day.humidity} ${AppLanguages.mm}',
                        style: AppSizes.textMiddle),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
