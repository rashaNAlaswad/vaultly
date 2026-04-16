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
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${l10n.didntReceiveIt} ',
          style: TextStyles.captionMuted.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
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
                  ? TextStyles.captionDisabled.copyWith(
                      color: colorScheme.onSurfaceVariant.withValues(
                        alpha: 0.5,
                      ),
                    )
                  : TextStyles.captionPrimary.copyWith(
                      color: colorScheme.primary,
                    ),
            ),
          ),
        ),
      ],
    ).animate().fadeIn(delay: 400.ms, duration: 600.ms);
  }
}
