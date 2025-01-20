import 'package:schedule/src/data/repos/schedule/model/schedule_day.dart';

abstract class ScheduleState {}

class ScheduleLoading extends ScheduleState {}

class ScheduleLoaded extends ScheduleState{
  final List<Map<String, ScheduleDay>> schedule;

  ScheduleLoaded(this.schedule);
}