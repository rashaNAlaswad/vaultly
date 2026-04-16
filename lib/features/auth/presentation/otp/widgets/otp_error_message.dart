import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';

/// Animated error message shown below the OTP input row on a wrong code.
class OtpErrorMessage extends StatelessWidget {
  const OtpErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error_outline, color: colorScheme.error, size: 16.sp),
        6.horizontalSpace,
        Text(
          l10n.incorrectCode,
          style: TextStyles.errorSmall.copyWith(color: colorScheme.error),
        ),
      ],
    )
        .animate()
        .fadeIn(duration: 300.ms)
        .shake(hz: 3, offset: const Offset(4, 0));
  }
}
