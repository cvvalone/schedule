import 'package:bloc/bloc.dart';
import 'package:schedule/src/data/repos/daily_task/model/daily_task.dart';

part 'daily_event.dart';
part 'daily_state.dart';

class DailyBloc extends Bloc<DailyEvent, DailyState> {
  DailyBloc() : super(DailyInitial()) {
    on<AddDailyTask>(
      (event, emit) {
        final currentState = state;
        if (currentState is DailyLoaded) {
          final newTask =
              DailyTask(title: event.title, id: DateTime.now().toString());
          emit(DailyLoaded([...currentState.tasks, newTask]));
        }else{
          emit(DailyLoaded([DailyTask(title: event.title, id: DateTime.now().toString())]));
        }
      },
    );
    on<ToggleDailyStatus>((event, emit) {
      final currentState = state;
      if(currentState is DailyLoaded){
        final updatedTasks = currentState.tasks.map((task) {
          if(task.id == event.id){
            return task.copyWith(isCompleted: !task.isCompleted);
          }
          return task;
        },).toList();
        emit(DailyLoaded(updatedTasks));
      }
    },);
    on<DeleteDailyTask>((event, emit) {
      final currentState = state;
      if(currentState is DailyLoaded){
        final updatedTasks = currentState.tasks.where((task) => task.id != event.id).toList();
        emit(DailyLoaded(updatedTasks));
      }
    },);
  }
}
