import 'package:flutter/material.dart';

import '../../../../../../core/helpers/responsive_helper.dart';
import '../../../../../../core/themes/app_colors.dart';
import '../../../../../../core/themes/text_styles.dart';

class PinHeroSection extends StatelessWidget {
  const PinHeroSection({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64.w,
          height: 64.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primary, AppColors.primaryContainer],
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.primaryContainerGlow20,
                blurRadius: 30,
                spreadRadius: 4,
              ),
            ],
          ),
          child: Icon(
            Icons.shield_rounded,
            color: AppColors.onPrimary,
            size: 30.w,
            semanticLabel: 'Security shield',
          ),
        ),
        20.verticalSpace,
        Text(title, style: TextStyles.largeText),
        12.verticalSpace,
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyles.heroSubtitle,
        ),
      ],
    );
  }
}
