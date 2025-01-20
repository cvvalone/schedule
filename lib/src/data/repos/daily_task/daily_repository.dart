import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schedule/src/data/repos/daily_task/model/daily_task.dart';
import 'package:schedule/src/features/daily/bloc/daily_bloc.dart';

class DailyRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<DailyTask>> loadDailyTask(LoadDailyTask event) async {
    final snapshot = await _firestore
        .collection('users')
        .doc(event.userId)
        .collection('dailyTasks')
        .get();
    final tasks = snapshot.docs.map((doc) {
      return DailyTask.fromJson(doc.data()).copyWith(id: doc.id);
    }).toList(growable: false);

    return tasks;
  }

  Future<void> addDailyTask(AddDailyTask event, newTask) async {
    await _firestore
        .collection('users')
        .doc(event.userId)
        .collection('dailyTasks')
        .add(newTask.toJson());
  }

  Future<void> toggleDailyTask(ToggleDailyStatus event, updatedTask) async {
    await _firestore
        .collection('users')
        .doc(event.userId)
        .collection('dailyTasks')
        .doc(updatedTask.id)
        .update({'isCompleted': updatedTask.isCompleted});
  }

  Future<void> deleteDailyTask(DeleteDailyTask event, task) async {
    await _firestore
        .collection('users')
        .doc(event.userId)
        .collection('dailyTasks')
        .doc(task.id)
        .delete();
  }
}
