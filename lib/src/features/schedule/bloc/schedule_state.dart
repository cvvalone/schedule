part of 'schedule_bloc.dart';

@freezed
class ScheduleState with _$ScheduleState {
  ScheduleState._();
  factory ScheduleState.idle({
    required ScheduleWeek schedule,
    String? message,
  }) = _Idle;
  factory ScheduleState.processing({
    required ScheduleWeek schedule,
    String? message,
  }) = _Processing;

  bool get isIdle => maybeMap(
        idle: (_) => true,
        orElse: () => false,
      );

  bool get isLoaded => maybeMap(
    idle: (state) => state.schedule.days.isNotEmpty,
    orElse:() => false,
  );
}
