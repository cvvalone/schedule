
part of 'daily_bloc.dart';


abstract class DailyEvent {
  const DailyEvent();
}

class AddDailyTask extends DailyEvent{
  final String title;

  AddDailyTask(this.title);
}

class DeleteDailyTask extends DailyEvent{
  final String id;
  
  DeleteDailyTask(this.id);
}

class ToggleDailyStatus extends DailyEvent{
  final String id;

  ToggleDailyStatus(this.id);
}