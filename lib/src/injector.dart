
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:open_weather/src/features/home/data/datasourses/remote/weather_service.dart';
import 'package:open_weather/src/features/home/data/repositories/weather_repository_impl.dart';
import 'package:open_weather/src/features/home/domain/repositories/weather_repository.dart';
import 'package:open_weather/src/features/home/presentation/bloc/remote_weather_bloc.dart';

import 'features/home/domain/usecases/fetch_weather_usecase.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector.registerSingleton<WeatherService>(WeatherService(injector()));
  injector.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(injector()));

  // UseCases
  injector.registerSingleton<FetchWeatherUseCase>(FetchWeatherUseCase(injector()));

  // BLoC
  injector.registerFactory<RemoteWeatherBloc>(() => RemoteWeatherBloc(fetchWeatherUseCase: injector()));
}