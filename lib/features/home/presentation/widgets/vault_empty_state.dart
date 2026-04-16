import 'package:flutter/material.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';

class VaultEmptyState extends StatelessWidget {
  const VaultEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 96.w,
          height: 96.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryContainerGlow20,
                      blurRadius: 60,
                      spreadRadius: 10,
                    ),
                  ],
                ),
              ),
              Container(
                width: 96.w,
                height: 96.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme.surfaceContainerLow,
                ),
                child: Icon(
                  Icons.shield_rounded,
                  size: 48.sp,
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.35),
                ),
              ),
            ],
          ),
        ),
        28.verticalSpace,
        Text(
          AppLocalizations.of(context).vaultEmpty,
          style: TextStyles.largeText,
        ),
        12.verticalSpace,
        Text(
          AppLocalizations.of(context).vaultEmptySubtitle,
          textAlign: TextAlign.center,
          style: TextStyles.heroSubtitle.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
