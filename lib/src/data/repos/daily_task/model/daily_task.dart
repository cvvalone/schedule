import 'package:hive/hive.dart';

part 'daily_task.g.dart';

@HiveType(typeId: 0)
class DailyTask {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String id;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final bool isCompleted;

  DailyTask({
    required this.title,
    required this.description,
    required this.id,
    required this.date,
    this.isCompleted = false,
  });

  DailyTask copyWith({
    String? title,
    String? description,
    DateTime? date,
    bool? isCompleted,
  }) {
    return DailyTask(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id,
      date: date ?? this.date,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
