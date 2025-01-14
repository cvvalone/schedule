part of 'daily_bloc.dart';

abstract class DailyState {}

class DailyLoading extends DailyState {}

class DailyLoaded extends DailyState {
  final List<DailyTask> tasks;

  DailyLoaded(this.tasks);
}

class DailyError extends DailyState {}
