part of 'daily_bloc.dart';

abstract class DailyEvent {
  const DailyEvent();
}

class LoadDailyTask extends DailyEvent {}

class AddDailyTask extends DailyEvent {
  final String title;
  final String description;
  final DateTime date;

  AddDailyTask(this.title, this.description, this.date);
}

class DeleteDailyTask extends DailyEvent {
  final String id;

  DeleteDailyTask(this.id);
}

class ToggleDailyStatus extends DailyEvent {
  final String id;

  ToggleDailyStatus(this.id);
}
