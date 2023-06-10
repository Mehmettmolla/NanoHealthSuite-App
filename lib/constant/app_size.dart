import 'package:flutter/material.dart';

class AppSize {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static const double logoWidht = 240;
  static const double logoHeight = 117;

  static const double productWidht = 370;
  static const double productHeight = 247;
}
