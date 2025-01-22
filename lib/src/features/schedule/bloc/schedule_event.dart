part of 'schedule_bloc.dart';


@freezed
class ScheduleEvent with _$ScheduleEvent {
  const factory ScheduleEvent.loadSchedule() = _loadSchedule;
}