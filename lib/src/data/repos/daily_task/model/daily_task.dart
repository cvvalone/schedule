import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_task.freezed.dart';
part 'daily_task.g.dart';

@freezed
class DailyTask with _$DailyTask {
  const factory DailyTask({
    required String title,
    required String description,
    String? id,
    required DateTime date,
    @Default(false) isCompleted,
  }) = _DailyTask;

  factory DailyTask.fromJson(Map<String, Object> json) => _$DailyTaskFromJson(json);
}
