import 'package:bloc/bloc.dart';

import '../../data/models/day_is_expanded.dart';

class DayExpandedCubit extends Cubit<bool> {
  DayExpandedCubit()
      : super(false);

  void pressDay() {
    emit(!state);
  }
}