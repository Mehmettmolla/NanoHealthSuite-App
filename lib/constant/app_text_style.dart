import 'package:flutter/material.dart';
import 'package:nano/constant/app_color.dart';

class AppTextStyle {
  static TextStyle smallText = const TextStyle(
    fontSize: 13,
  );
  static TextStyle xsMediumRegularText = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static TextStyle mediumText = const TextStyle(
    fontSize: 17,
  );
  static TextStyle mediumRegularText = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );
  static TextStyle mediumWhiteRegularText = const TextStyle(
    fontSize: 17,
    color: AppColor.white,
    fontWeight: FontWeight.w400,
  );
  static TextStyle largeText = const TextStyle(
    fontSize: 34,
  );
  static TextStyle largeWhiteBoldText = const TextStyle(
    fontSize: 34,
    color: AppColor.white,
    fontWeight: FontWeight.w700,
  );
}
