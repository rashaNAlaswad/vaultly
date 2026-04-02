import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/responsive_helper.dart';
import 'app_colors.dart';

class TextStyles {
  TextStyles._();

  static TextStyle _inter(
    double fontSize,
    Color color,
    FontWeight fontWeight, {
    double? height,
    double? letterSpacing,
  }) => GoogleFonts.inter(
    fontSize: fontSize.sp,
    color: color,
    fontWeight: fontWeight,
    height: height,
    letterSpacing: letterSpacing,
  );

  static TextStyle _jakarta(
    double fontSize,
    Color color,
    FontWeight fontWeight, {
    double? height,
    double? letterSpacing,
  }) => GoogleFonts.plusJakartaSans(
    fontSize: fontSize.sp,
    color: color,
    fontWeight: fontWeight,
    height: height,
    letterSpacing: letterSpacing,
  );

  //Hero section
  static final heroTitle = _jakarta(36, AppColors.onSurface, FontWeight.w800);
  static final heroSubtitle = _inter(
    14,
    AppColors.onSurfaceVariant,
    FontWeight.w400,
  );

  //Form
  static final fieldLabel = _inter(
    10,
    AppColors.onSurfaceVariant,
    FontWeight.w600,
    letterSpacing: 2,
  );

  static final inputText = _inter(17, AppColors.onSurface, FontWeight.w400);

  static final inputHint = _inter(17, AppColors.hintText, FontWeight.w400);

  //Buttons
  static final buttonLabel = _jakarta(15, AppColors.onPrimary, FontWeight.w700);

  static final buttonLabelDisabled = _jakarta(
    15,
    AppColors.subtleText,
    FontWeight.w700,
    letterSpacing: 0.5,
  );
}
