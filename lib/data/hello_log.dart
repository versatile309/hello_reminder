import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hello_reminder/data/enums/hello_action.dart';
part 'hello_log.freezed.dart';
part 'hello_log.g.dart';

@freezed
class HelloLog with _$HelloLog {
  const factory HelloLog({
    required String id,
    required String timdstamp,
    required HelloAction helloAction,
  }) = _HelloLog;

  factory HelloLog.fromJson(Map<String, Object?> json)
      => _$HelloLogFromJson(json);
}