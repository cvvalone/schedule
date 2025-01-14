part of 'daily_bloc.dart';


abstract class DailyState {

}

class DailyInitial extends DailyState{

}

class DailyLoaded extends DailyState{
  final List<DailyTask> tasks;

  DailyLoaded(this.tasks);
}