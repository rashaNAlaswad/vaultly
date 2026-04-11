import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.glassContainer,
                boxShadow: const [
                  BoxShadow(color: AppColors.primaryGlow15, blurRadius: 20),
                ],
              ),
              child: const Icon(
                Icons.shield,
                color: AppColors.primary,
                size: 36,
                semanticLabel: 'Vaultly security shield',
              ),
            )
            .animate()
            .fadeIn(duration: 600.ms)
            .scale(begin: const Offset(0.8, 0.8)),
        24.verticalSpace,
        Text(
          l10n.appName,
          style: TextStyles.heroTitle,
        ).animate().fadeIn(delay: 100.ms, duration: 600.ms).slideY(begin: 0.1),
        12.verticalSpace,
        Text(
          l10n.appTagline,
          textAlign: TextAlign.center,
          style: TextStyles.heroSubtitle,
        ).animate().fadeIn(delay: 200.ms, duration: 600.ms).slideY(begin: 0.1),
      ],
    );
  }
}
