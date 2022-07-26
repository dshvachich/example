import 'package:intl/intl.dart';

class DateTimeUtils {
  static bool isSameDay(DateTime date, DateTime sameDate) {
    return DateTime(date.year, date.month, date.day) == DateTime(sameDate.year, sameDate.month, sameDate.day);
  }

  static bool isToday(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return DateTime(date.year, date.month, date.day) == today;
  }

  static bool isYesterday(DateTime date) {
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    return DateTime(date.year, date.month, date.day) == yesterday;
  }

  static bool isCurrentYear(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year;
  }

  static String formatDate(DateTime date, String format) {
    var formatter = DateFormat(format);
    return formatter.format(date);
  }

  static String buildDateAndTimeString(DateTime dateTime) {
    return DateFormat('yyyy.MM.dd HH:mm').format(dateTime);
  }

  static int get dayInMillis => 24 * 60 * 60 * 1000;
}
