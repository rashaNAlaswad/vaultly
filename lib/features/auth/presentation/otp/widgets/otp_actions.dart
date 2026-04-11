import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/themes/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';

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
    final l10n = AppLocalizations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${l10n.didntReceiveIt} ', style: TextStyles.captionMuted),
        Semantics(
          button: true,
          enabled: resendSeconds == 0,
          label: resendSeconds > 0
              ? l10n.resendAvailableIn(resendSeconds)
              : 'Resend code',
          child: GestureDetector(
            onTap: resendSeconds == 0 ? onResend : null,
            child: Text(
              resendSeconds > 0 ? l10n.resendIn(resendSeconds) : l10n.resend,
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
