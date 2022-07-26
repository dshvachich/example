class DateTimeJsonFormatter {
  static DateTime? dateTimeFromEpochUs(int? us) => us == null ? null : DateTime.fromMillisecondsSinceEpoch(us * 1000);

  static int dateTimeToEpochUs(DateTime? dateTime) => (dateTime?.millisecondsSinceEpoch ?? 0) ~/ 1000;
}
