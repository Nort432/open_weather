import 'package:flutter/material.dart';
import 'package:open_weather/src/config/app_sizes/app_sizes.dart';

class MyTextCelsius extends StatelessWidget {
  const MyTextCelsius({Key? key, required this.tempC}) : super(key: key);

  final double tempC;

  @override
  Widget build(BuildContext context) {
    //°C
    return Text(
      '+ $tempC°C',
      style: AppSizes.textMiddle,
    );
  }
}
