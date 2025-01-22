import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:schedule/src/data/repos/schedule/model/schedule_lesson/schedule_lesson.dart';

part 'schedule_day.freezed.dart';
part 'schedule_day.g.dart';

@freezed
class ScheduleDay with _$ScheduleDay {
  const factory ScheduleDay({
    required String weekDay,
    required List<ScheduleLesson> lessons,
  }) = _ScheduleDay;

  factory ScheduleDay.fromJson(Map<String, dynamic> json) => _$ScheduleDayFromJson(json);
}
