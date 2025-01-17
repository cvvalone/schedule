part of 'daily_bloc.dart';

abstract class DailyEvent {
  const DailyEvent();
}

class LoadDailyTask extends DailyEvent {
  final String userId;

  LoadDailyTask(this.userId);
}

class AddDailyTask extends DailyEvent {
  final String userId;
  final String title;
  final String description;
  final DateTime date;

  AddDailyTask(this.userId, this.title, this.description, this.date);
}

class DeleteDailyTask extends DailyEvent {
  final String userId;
  final String id;

  DeleteDailyTask(this.userId, this.id);
}

class ToggleDailyStatus extends DailyEvent {
  final String userId;
  final String id;

  ToggleDailyStatus(this.userId, this.id);
}
