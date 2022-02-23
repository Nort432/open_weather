// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _WeatherService implements WeatherService {
  _WeatherService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://api.weatherapi.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<WeatherModel>> fetchWeatherService(
      {required apiKey, required city, required day}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'key': apiKey,
      r'q': city,
      r'days': day
    };
    try {
      final _headers = <String, dynamic>{};
      final _data = <String, dynamic>{};
      final _result = await _dio.fetch<Map<String, dynamic>>(
          _setStreamType<HttpResponse<WeatherModel>>(
              Options(method: 'GET', headers: _headers, extra: _extra)
                  .compose(_dio.options, '/v1/forecast.json',
                  queryParameters: queryParameters, data: _data)
                  .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
      final value = WeatherModel.fromJson(_result.data!);
      final httpResponse = HttpResponse(value, _result);
      return httpResponse;
    }catch (e) {
      print(e);
    }
    throw '';
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
