import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/themes/text_styles.dart';

/// resend link shown at the bottom of the OTP screen.
class ResendLink extends StatelessWidget {
  const ResendLink({
    super.key,
    required this.resendSeconds,
    required this.onResend,
  });

  final int resendSeconds;
  final VoidCallback onResend;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Didn't receive it? ", style: TextStyles.captionMuted),
        Semantics(
          button: true,
          enabled: resendSeconds == 0,
          label: resendSeconds > 0
              ? 'Resend available in $resendSeconds seconds'
              : 'Resend code',
          child: GestureDetector(
            onTap: resendSeconds == 0 ? onResend : null,
            child: Text(
              resendSeconds > 0 ? 'Resend in ${resendSeconds}s' : 'Resend',
              style: resendSeconds > 0
                  ? TextStyles.captionDisabled
                  : TextStyles.captionPrimary,
            ),
          ),
        ),
      ],
    ).animate().fadeIn(delay: 400.ms, duration: 600.ms);
  }
}
