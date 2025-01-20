import 'package:intl/intl.dart';

class DateHelper {
  static String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat("d MMMM, yyyy", "uk_UA");
    return formatter.format(date);
  }

  static List<Map<String, dynamic>> generateWeekdays(int numberOfDays) {
    final today = DateTime.now();
    final weekdayNames = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт'];

    // Генеруємо список робочих днів
    List<Map<String, dynamic>> days = [];
    int addedDays = 0;
    DateTime currentDate = today;

    while (addedDays < numberOfDays) {
      // Перевіряємо, чи не субота або неділя
      if (currentDate.weekday >= DateTime.monday &&
          currentDate.weekday <= DateTime.friday) {
        days.add({
          'day': currentDate.day,
          'weekday': weekdayNames[currentDate.weekday - 1],
          'fullDate':
              '${currentDate.day} ${weekdayNames[currentDate.weekday - 1]}',
        });
        addedDays++;
      }
      // Переходимо до наступного дня
      currentDate = currentDate.add(const Duration(days: 1));
    }

    return days;
  }

  static bool isToday(String date) {
    final now = DateTime.now();
    final weekdayNames = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт'];
    return date == '${now.day} ${weekdayNames[now.weekday - 1]}';
  }
}
