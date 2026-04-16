import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';

class InstructionHeader extends StatelessWidget {
  const InstructionHeader({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorScheme.primaryContainer.withValues(alpha: 0.2),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primaryContainer.withValues(alpha: 0.2),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Icon(
                Icons.shield,
                color: colorScheme.primary,
                size: 36.sp,
                semanticLabel: 'Security verification shield',
              ),
            )
            .animate()
            .fadeIn(duration: 600.ms)
            .scale(begin: const Offset(0.8, 0.8)),
        24.verticalSpace,
        Text(
          l10n.securityCheck,
          style: TextStyles.heroTitle,
        ).animate().fadeIn(delay: 100.ms, duration: 600.ms).slideY(begin: 0.1),
        12.verticalSpace,
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyles.heroSubtitle.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            children: [
              TextSpan(text: l10n.otpSentPrefix),
              TextSpan(
                text: email,
                style: TextStyles.bodyLink.copyWith(
                  color: colorScheme.primary,
                ),
              ),
              TextSpan(text: l10n.otpSentSuffix),
            ],
          ),
        ).animate().fadeIn(delay: 200.ms, duration: 600.ms).slideY(begin: 0.1),
      ],
    );
  }
}
