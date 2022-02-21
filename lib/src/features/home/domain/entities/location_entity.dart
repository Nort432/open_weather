import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  const LocationEntity({
    required this.name,
    required this.country,
    required this.localtime,
  });
   final String name;
   final String country;
   final String localtime;

  @override
  List<Object?> get props => [name, country, localtime];

  @override
  bool get stringify => true;
}