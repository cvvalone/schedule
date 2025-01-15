import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:schedule/src/data/repos/daily_task/model/daily_task.dart';

part 'daily_event.dart';
part 'daily_state.dart';

class DailyBloc extends Bloc<DailyEvent, DailyState> {
  final Box<DailyTask> taskBox;

  DailyBloc(this.taskBox) : super(DailyLoading()) {
    on<LoadDailyTask>(_onLoadDailyTask);
    on<AddDailyTask>(_onAddDailyTask);
    on<ToggleDailyStatus>(_onToggleDailyStatus);
    on<DeleteDailyTask>(_onDeleteDailyTask);
  }

  Future<void> _onLoadDailyTask(
      LoadDailyTask event, Emitter<DailyState> emit) async {
    final tasks = taskBox.values.toList();
    emit(DailyLoaded(tasks));
  }

  void _onAddDailyTask(AddDailyTask event, Emitter<DailyState> emit) async {
    final newTask = DailyTask(
      title: event.title,
      description: event.description,
      date: event.date,
      id: DateTime.now().toString(),
    );
    await taskBox.put(newTask.id, newTask);
    add(LoadDailyTask());
  }

  Future<void> _onToggleDailyStatus(
      ToggleDailyStatus event, Emitter<DailyState> emit) async {
    final task = taskBox.get(event.id);
    if (task != null) {
      final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
      await taskBox.put(event.id, updatedTask);
      add(LoadDailyTask());
    }
  }

  Future<void> _onDeleteDailyTask(
      DeleteDailyTask event, Emitter<DailyState> emit) async {
    await taskBox.delete(event.id);
    add(LoadDailyTask());
  }
}
