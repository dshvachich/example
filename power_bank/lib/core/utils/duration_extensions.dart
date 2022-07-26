extension DurationExtension on Duration {
  String getTimeString() {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String oneDigit(int n) {
      return "$n";
    }

    String oneDigitMinutes = oneDigit(this.inMinutes.remainder(60));
    String twoDigitsMinutes = twoDigits(this.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(this.inSeconds.remainder(60));
    if (this.inHours > 0)
      return "${twoDigits(this.inHours)}:$oneDigitMinutes:$twoDigitSeconds";
    else if (this.inMinutes >= 10)
      return "$twoDigitsMinutes:$twoDigitSeconds";
    else
      return "$oneDigitMinutes:$twoDigitSeconds";
  }
}
