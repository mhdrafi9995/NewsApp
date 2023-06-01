import 'package:flutter/material.dart';

class ScreenSize {
  static const double w = 375;
  static const double h = 812;

  static double sH(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double sW(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
