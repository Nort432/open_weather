import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather/src/config/app_consts/app_consts.dart';
import 'package:open_weather/src/config/app_languages/app_languages.dart';
import 'package:open_weather/src/features/home/domain/entities/mode_entity.dart';
import 'package:open_weather/src/features/home/presentation/bloc/remote_weather_bloc.dart';

class MyAppBar {
  const MyAppBar({required this.context});

  final BuildContext context;

  PreferredSizeWidget init() {
    List<String> items = ModeEntity().items;
    String currentValue = items.first;

    return AppBar(
      title: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: currentValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  context
                      .read<RemoteWeatherBloc>()
                      .add(ChoiceModeEvent(newValue));
                  currentValue = newValue;
                }
                if (newValue == null) {
                  context
                      .read<RemoteWeatherBloc>()
                      .add(ChoiceModeEvent(items.first));
                  currentValue = items.first;
                }
              },
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            myButton('ru', () {
              AppLanguages.language = kRussian;
              context.read<RemoteWeatherBloc>().add(ChoiceModeEvent(ModeEntity().items.first));
            }),
            const SizedBox(width: 5,),
            myButton('en', () {
              AppLanguages.language = kEnglish;
              context.read<RemoteWeatherBloc>().add(ChoiceModeEvent(ModeEntity().items.first));
            })
          ],),
        )
      ],
    );
  }

  Widget myButton(String name, onTap) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              primary: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: onTap,
            child: Text(name),
          ),
        ],
      ),
    );
  }
}
