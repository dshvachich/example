import 'package:intl/intl.dart';

extension NumExtensions on num? {
  String get formatAsCurrency {
    if (this == null) return '';
    final format = NumberFormat("#,##0", "ru_RU");
    return "${format.format(this)} ₽";
  }

  String get formatAsCurrencyWithHours {
    return "${this.formatAsCurrency}/час";
  }

  String withPostfix(String val1, String val2, String val3, {bool alwaysPrintNumber = false}) {
    if (this == null) return '';
    String relations = "";
    if (this == 0) return relations;
    int ageLastNumber = (this! % 10).toInt();
    bool isExclusion = (this! % 100 >= 11) && (this! % 100 <= 14);
    if (ageLastNumber == 1) {
      if (this == 1 && !alwaysPrintNumber) {
        relations = "$val1";
      } else {
        relations = "$this $val1";
      }
    } else {
      if (ageLastNumber == 0 || ageLastNumber >= 5 && ageLastNumber <= 9) {
        relations = "$this $val3";
      } else {
        if (ageLastNumber >= 2 && ageLastNumber <= 4) {
          relations = "$this $val2";
        }
      }
    }
    if (isExclusion) {
      relations = "$this $val3";
    }
    return relations;
  }
}
