extension StringExtensions on String {
  String removeTrailingZeros() {
    return this.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
  }
}
