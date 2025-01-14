class DailyTask {
  final String title;
  final String id;
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
