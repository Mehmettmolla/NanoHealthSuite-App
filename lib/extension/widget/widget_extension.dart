import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Padding paddingAll(double val) => Padding(
        padding: EdgeInsets.all(val),
        child: this,
      );
  Padding paddingOnly(
          {double? top, double? bottom, double? left, double? right}) =>
      Padding(
        padding: EdgeInsets.only(
            top: top ?? 0.0,
            bottom: bottom ?? 0.0,
            left: left ?? 0.0,
            right: right ?? 0.0),
        child: this,
      );
  Padding paddingSymetric({double? horizontal, double? vertical}) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontal ?? 0.0, vertical: vertical ?? 0.0),
        child: this,
      );
}

extension SizedBoxExtension on Widget {
  SizedBox gap({double? width, double? height}) => SizedBox(
        height: height,
        width: width,
        child: this,
      );
}

extension OnTapExtension on Widget {
  GestureDetector gestureDetector({Function()? onTap}) => GestureDetector(
        onTap: onTap,
        child: this,
      );
}
