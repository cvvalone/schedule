import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:schedule/src/data/repos/daily_task/model/daily_task.dart';

part 'daily_event.dart';
part 'daily_state.dart';

class DailyBloc extends Bloc<DailyEvent, DailyState> {
  final FirebaseFirestore _firestore;

  DailyBloc({required FirebaseFirestore firestore})
      : _firestore = firestore,
        super(DailyLoading()) {
    on<LoadDailyTask>(_onLoadDailyTask);
    on<AddDailyTask>(_onAddDailyTask);
    on<ToggleDailyStatus>(_onToggleDailyStatus);
    on<DeleteDailyTask>(_onDeleteDailyTask);
  }

  Future<void> _onLoadDailyTask(
      LoadDailyTask event, Emitter<DailyState> emit) async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(event.userId)
          .collection('dailyTasks')
          .get();
      final tasks = snapshot.docs.map((doc) {
        return DailyTask.fromJson(doc.data())
            .copyWith(id: doc.id);
      }).toList(growable: false);

      emit(DailyLoaded(tasks));
    } on FirebaseException catch (e) {
      emit(DailyError('FirebaseException: ${e.message}'));
      debugPrint('FirebaseException: ${e.message}');
    }
  }

  void _onAddDailyTask(AddDailyTask event, Emitter<DailyState> emit) async {
    final newTask = DailyTask(
        title: event.title, description: event.description, date: event.date);

    await _firestore
        .collection('users')
        .doc(event.userId)
        .collection('dailyTasks')
        .add(newTask.toJson());

    add(LoadDailyTask(event.userId));
  }

  Future<void> _onToggleDailyStatus(
      ToggleDailyStatus event, Emitter<DailyState> emit) async {
    final _currentState = state;
    if (_currentState is DailyLoaded) {
      final task = _currentState.tasks.firstWhere((task) => task.id == event.id,
          orElse: () => throw Exception('Task with id: ${event.id} not found'));

      final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
      try {
        await _firestore
            .collection('users')
            .doc(event.userId)
            .collection('dailyTasks')
            .doc(updatedTask.id)
            .update({'isCompleted': updatedTask.isCompleted});
      } catch (e) {
        DailyError('Failed to update tasks: ${e.toString}');
      }
      add(LoadDailyTask(event.userId));
    }
  }

  Future<void> _onDeleteDailyTask(
      DeleteDailyTask event, Emitter<DailyState> emit) async {
    final _currentState = state;
    if (_currentState is DailyLoaded) {
      final task = _currentState.tasks.firstWhere((task) => task.id == event.id,
          orElse: () => throw Exception('Task with id: ${event.id} not found'));
      try {
        await _firestore
            .collection('users')
            .doc(event.userId)
            .collection('dailyTasks')
            .doc(task.id)
            .delete();
        add(LoadDailyTask(event.userId));
      } catch (e) {
        DailyError('Failed to delete task: ${e.toString()}');
      }
    }
  }
}
