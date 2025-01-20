import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_day.freezed.dart';
part 'schedule_day.g.dart';

@freezed
class ScheduleDay with _$ScheduleDay {
  const factory ScheduleDay({
    required String audithory,
    required String subject,
    String? id,
    required String teacher,
    required String time_start,
    required String time_end,
  }) = _ScheduleDay;

  factory ScheduleDay.fromJson(Map<String, dynamic> json) => _$ScheduleDayFromJson(json);
}
