class ScheduleViewCalc {
  static double calculateTop(DateTime startTime, double hourHeight) {
    // Різниця часу від початку дня (наприклад, 8:30)
    final startMinutes = startTime.hour * 60 + startTime.minute;
    final dayStartMinutes = 8 * 60 + 30; // Початок дня
    return (startMinutes - dayStartMinutes) / 60 * hourHeight;
  }

  static double calculateHeight(Duration duration, double hourHeight) {
    return duration.inMinutes / 60 * hourHeight;
  }
}
