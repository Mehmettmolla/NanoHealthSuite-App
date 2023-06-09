extension StringExtension on String {
  bool get isEmail => contains("@") && contains(".");
}
