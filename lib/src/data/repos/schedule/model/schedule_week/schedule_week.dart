import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:schedule/src/data/repos/schedule/model/schedule_day/schedule_day.dart';

part 'schedule_week.freezed.dart';
part 'schedule_week.g.dart';

@freezed
class ScheduleWeek with _$ScheduleWeek {
  const factory ScheduleWeek({
    @Default(false) bool isEvenWeek,
    required List<ScheduleDay> days,
  }) = _ScheduleWeek;

  factory ScheduleWeek.fromJson(Map<String, dynamic> json) => _$ScheduleWeekFromJson(json);
}
