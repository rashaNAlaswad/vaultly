import 'package:flutter/material.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';

class BiometricUnlockHero extends StatelessWidget {
  const BiometricUnlockHero({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Semantics(
          button: true,
          label: l10n.biometricUnlockSemanticLabel,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              width: 80.w,
              height: 80.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryGlow15,
              ),
              child: Icon(
                Icons.fingerprint_rounded,
                size: 48.w,
                color: colorScheme.primary,
              ),
            ),
          ),
        ),
        20.verticalSpace,
        Text(
          l10n.biometricTouchToUnlock,
          style: TextStyles.screenTitle,
          textAlign: TextAlign.center,
        ),
        12.verticalSpace,
        Text(
          l10n.biometricOrUsePin,
          style: TextStyles.captionMuted.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
