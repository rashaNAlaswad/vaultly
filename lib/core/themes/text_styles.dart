import 'package:flutter/material.dart';

import '../helpers/responsive_helper.dart';

class TextStyles {
  TextStyles._();

  static TextStyle _style(
    double fontSize,
    Color color,
    FontWeight fontWeight, {
    double? height,
  }) => TextStyle(
        fontSize: fontSize.sp,
        color: color,
        fontWeight: fontWeight,
        height: height,
      );
}