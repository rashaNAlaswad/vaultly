import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/text_styles.dart';

/// Animated error message shown below the OTP input row on a wrong code.
class OtpErrorMessage extends StatelessWidget {
  const OtpErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error_outline, color: AppColors.error, size: 16.sp),
        6.horizontalSpace,
        Text('Incorrect code, try again', style: TextStyles.errorSmall),
      ],
    )
        .animate()
        .fadeIn(duration: 300.ms)
        .shake(hz: 3, offset: const Offset(4, 0));
  }
}
