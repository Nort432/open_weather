import 'package:equatable/equatable.dart';
import 'package:open_weather/src/features/home/domain/entities/current_entity.dart';
import 'package:open_weather/src/features/home/domain/entities/location_entity.dart';

import '../../data/models/location_model.dart';
import 'forecast_entity.dart';

class ModeEntity extends Equatable {
  //const ModeEntity();

  final List<String> items = ['By days', 'By hours'];


  @override
  List<Object> get props => [items];

  @override
  bool get stringify => true;
}


