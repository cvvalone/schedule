part of 'schedule_bloc.dart';

@freezed
class ScheduleState with _$ScheduleState {
  ScheduleState._();
  factory ScheduleState.idle({
    required ScheduleWeek schedule,
    String? message,
  }) = _Initial;
  factory ScheduleState.processing({
    required ScheduleWeek schedule,
    String? message,
  }) = _Processing;

  bool get isIdle => maybeMap(
        idle: (_) => true,
        orElse: () => false,
      );
}
