import 'package:hive/hive.dart';

part 'daily_task.g.dart';

@HiveType(typeId: 0)
class DailyTask {
  
  @HiveField(0)
  final String title;
  
  @HiveField(1)
  final String id;
  
  @HiveField(2)
  final bool isCompleted;

  DailyTask({
    required this.title,
    required this.id,
    this.isCompleted = false,
  });

  DailyTask copyWith({String? title, bool? isCompleted}) {
    return DailyTask(
      title: title ?? this.title,
      id: id,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
