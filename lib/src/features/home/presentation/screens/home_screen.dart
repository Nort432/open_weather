import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather/src/features/home/presentation/bloc/remote_weather_bloc.dart';
import 'package:open_weather/src/features/home/presentation/widgets/home_scaffold_widget.dart';

import '../../../../config/app_colors/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBloc(context);
  }

  Widget _buildBloc(BuildContext context) {
    Widget loading = const Scaffold(
        body: Center(
            child: CupertinoActivityIndicator(
              color: AppColors.loading,
            )));

    return BlocBuilder<RemoteWeatherBloc, RemoteWeatherState>(
        builder: (context, state) {
          if (state is RemoteWeatherLoading) {
            return loading;
          }
          if (state is RemoteWeatherError) {
            SchedulerBinding.instance!.addPostFrameCallback((_) {
              // _pushErrorView(context, state.error.message);
              print('Remote Weather Error: ${state.error.message}');
            });
            return const SizedBox();
          }
          if (state is RemoteWeatherDone) {
            return HomeScaffoldWidget(weatherEntity: state.weatherEntity, isShowDays: state.isShowDays,);
          }
          return const SizedBox();
        });
  }
}
