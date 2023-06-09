import 'package:flutter/material.dart';

class AppRadius {
  static BorderRadius buttonRadius = BorderRadius.circular(62.0);
  static BorderRadius cardRadius = BorderRadius.circular(16.0);
  static BorderRadius navBarRadius = BorderRadius.circular(22.0);
  static BorderRadius appBarRadius = const BorderRadius.only(
    bottomLeft: Radius.circular(35.0),
    bottomRight: Radius.circular(35.0),
  );
  static BorderRadius bottomSheetRadius = const BorderRadius.only(
    topLeft: Radius.circular(35.0),
    topRight: Radius.circular(35.0),
  );
}
