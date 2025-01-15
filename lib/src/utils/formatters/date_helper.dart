import 'package:intl/intl.dart';

class DateHelper {
  static String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat("d MMMM, yyyy", "uk_UA");
    return formatter.format(date);
  }
}