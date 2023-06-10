import 'package:flutter/painting.dart';

class AppColor {
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color blue = Color(0xFF2AB3C6);
  static const Color lightBlue = Color(0xFF188095);
  static const Color navyBlue = Color(0xFF08293B);
  static const Color starYellow = Color(0xFFFFE072);
  static const Color grey = Color(0xFFF1F1F1);

  static const gradientBlue = LinearGradient(
    colors: [lightBlue,blue],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
