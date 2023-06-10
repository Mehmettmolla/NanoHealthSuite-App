extension StringExtension on String {
  bool get isEmail => contains("@") && contains(".");
  bool get isNotShort => length >= 3;
}
