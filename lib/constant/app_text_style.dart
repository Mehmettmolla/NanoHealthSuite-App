import 'package:NanoHealthSuiteApp/constant/app_color.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
   static TextStyle xsSmallText = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
  static TextStyle smallText = const TextStyle(
    fontSize: 13,
  );
  static TextStyle xsMediumRegularText = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static TextStyle xsMediumItalicText = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
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
  static TextStyle xlMediumWhiteRegularText = const TextStyle(
    fontSize: 22,
    color: AppColor.white,
    fontWeight: FontWeight.w700,
  );
  static TextStyle xsLargeBoldText = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );
  static TextStyle xsLargeBoldWhiteText = const TextStyle(
    fontSize: 28,
    color: AppColor.white,
    fontWeight: FontWeight.w700,
  );
  static TextStyle largeBoldText = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColor.navyBlue,
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
