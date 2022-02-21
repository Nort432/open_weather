import 'package:open_weather/src/features/home/domain/entities/condition_entity.dart';

class ConditionModel extends ConditionEntity {
  const ConditionModel(
      {required String text, required String icon, required int code})
      : super(text: text, icon: icon, code: code);

  factory ConditionModel.fromJson(Map<String, dynamic> json) {
    return ConditionModel(
        text: json['text'], icon: json['icon'], code: json['code']);
  }
}
