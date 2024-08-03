import 'package:flutter/material.dart';
import 'dart:math';

class ScreenSizeCalc {
  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double getHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double getWidthByRatio(BuildContext context, double ratio) =>
      MediaQuery.of(context).size.width * ratio;
  static double getHeightByRatio(BuildContext context, double ratio) =>
      MediaQuery.of(context).size.height * ratio;
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = getWidth(context);
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
