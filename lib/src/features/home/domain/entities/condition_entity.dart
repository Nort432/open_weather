import 'package:equatable/equatable.dart';

class ConditionEntity extends Equatable {
  const ConditionEntity({
    required this.text,
    required this.icon,
    required this.code,
  });
   final String text;
   final String icon;
   final int code;

  @override
  List<Object?> get props => [text, icon, code];

  @override
  bool get stringify => true;
}