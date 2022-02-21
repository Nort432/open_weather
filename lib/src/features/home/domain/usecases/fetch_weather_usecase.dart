import 'package:open_weather/src/core/params/weather_params.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/weather_entity.dart';
import '../repositories/weather_repository.dart';

class FetchWeatherUseCase
    implements UseCase<DataState<WeatherEntity>, WeatherParams> {
  const FetchWeatherUseCase(this._weatherRepository);

  final WeatherRepository _weatherRepository;

  @override
  Future<DataState<WeatherEntity>> call(WeatherParams weatherParams) async {
    return await _weatherRepository.fetchWeatherRepository(weatherParams);
  }
}