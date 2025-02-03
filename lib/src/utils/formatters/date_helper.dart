import 'package:intl/intl.dart';

class DateHelper {
  static String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat("d MMMM, yyyy", "uk_UA");
    return formatter.format(date);
  }

  static bool isToday(String date) {
    final now = DateTime.now();
    final weekdayNames = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт'];
    return date == '${now.day} ${weekdayNames[now.weekday - 1]}';
  }

  static bool isEvenWeek(DateTime date) {
    final startOfYear = DateTime(date.year, 1, 1);
    int dayOfYear = date.difference(startOfYear).inDays + 1;
    int weekOfYear = ((dayOfYear - date.weekday + 10) / 7).floor();
    return weekOfYear % 2 == 0;
  }

  static String getWeekDayName(int weekday) {
    const weekDays = ['Нд', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'];
    return weekDays[weekday % 7];
  }

  static int getWeekDayDate(String weekDay) {
    const weekDays = ['Нд', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'];
    int weekDayIndex = weekDays.indexWhere((element) => weekDay == element);

    if (weekDayIndex == -1)
      return DateTime.now()
          .day; // Якщо день не знайдено, повертаємо сьогоднішній день

    DateTime now = DateTime.now();
    DateTime firstDayOfWeek =
        now.subtract(Duration(days: now.weekday % 7)); // Отримуємо неділю
    DateTime targetDate = firstDayOfWeek.add(Duration(days: weekDayIndex));

    return targetDate.day; // Повертаємо число
  }

  static List<int> takePartsFromHour(String hour) {
    List<String> startParts = hour.split(':');
    int startHour = int.parse(startParts[0]);
    int startMinute = int.parse(startParts[1]);
    return [startHour, startMinute];
  }
}
