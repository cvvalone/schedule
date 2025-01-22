import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_lesson.freezed.dart';
part 'schedule_lesson.g.dart';

@freezed
class ScheduleLesson with _$ScheduleLesson {
  const factory ScheduleLesson({
    required String audithory,
    required String subject,
    String? id,
    required String teacher,
    required String timeStart,
    required String timeEnd,
  }) = _ScheduleLesson;

  factory ScheduleLesson.fromJson(Map<String, dynamic> json) => _$ScheduleLessonFromJson(json);
}
