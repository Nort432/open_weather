import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather/src/features/home/presentation/bloc/remote_weather_bloc.dart';
import 'package:open_weather/src/injector.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/config/app_routes/app_routes.dart';
import 'src/config/app_themes/app_theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  await initialization();
  // await Hive.initFlutter();

  runApp(const MyApp());
}

Future initialization() async {
  /// Load resources
  await Future.delayed(const Duration(seconds: 3));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteWeatherBloc>(
      create: (context) => injector()..add(const FetchWeatherEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        theme: AppTheme.light,
      ),
    );
  }
}
