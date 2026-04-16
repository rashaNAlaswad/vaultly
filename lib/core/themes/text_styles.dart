import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/responsive_helper.dart';

class TextStyles {
  TextStyles._();

  static TextStyle _inter(
    double fontSize,
    FontWeight fontWeight, {
    Color? color,
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
    FontWeight fontWeight, {
    Color? color,
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
  static final heroTitle = _jakarta(30, FontWeight.w800);
  static final heroSubtitle = _inter(
    14,
    FontWeight.w400,
    height: 1.6,
  );

  //Form
  static final fieldLabel = _inter(
    10,
    FontWeight.w600,
    letterSpacing: 2,
  );

  static final inputText = _inter(15, FontWeight.w400);

  static final inputHint = _inter(15, FontWeight.w400);

  //Buttons
  static final buttonLabel = _jakarta(15, FontWeight.w700);

  static final buttonLabelDisabled = _jakarta(
    15,
    FontWeight.w700,
    letterSpacing: 0.5,
  );

  // Navigation / Screen headers
  static final screenTitle = _jakarta(16, FontWeight.w700);

  // link text (same size as bodyRegular)
  static final bodyLink = _inter(14, FontWeight.w600);

  // Small error messages
  static final errorSmall = _inter(13, FontWeight.w500);

  // Small muted captions / add new tag text
  static final captionMuted = _inter(
    13,
    FontWeight.w400,
  );

  // Small primary-coloured captions (active links, resend)
  static final captionPrimary = _inter(13, FontWeight.w600);

  // Small disabled / countdown captions
  static final captionDisabled = _inter(
    13,
    FontWeight.w600,
  );

  // OTP digit display inside a box / vault empty state title
  static final largeText = _jakarta(22, FontWeight.w700);
}
