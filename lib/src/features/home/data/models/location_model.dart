import 'package:open_weather/src/features/home/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  const LocationModel(
      {required String name,
      required String country,
      required String localtime})
      : super(name: name, country: country, localtime: localtime);

  factory LocationModel.fromJson(Map<String, dynamic> json){
    return LocationModel(
        name: json['name'],
        country: json['country'],
        localtime: json['localtime']);
  }
}
