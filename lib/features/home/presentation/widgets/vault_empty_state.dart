import 'package:flutter/material.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/text_styles.dart';

class VaultEmptyState extends StatelessWidget {
  const VaultEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
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
              // Icon container
              Container(
                width: 96.w,
                height: 96.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.surfaceContainerLow,
                ),
                child: Icon(
                  Icons.shield_rounded,
                  size: 48.sp,
                  color: AppColors.onSurfaceVariant.withValues(alpha: 0.35),
                ),
              ),
            ],
          ),
        ),
        28.verticalSpace,
        Text('Your vault is empty', style: TextStyles.largeText),
        12.verticalSpace,
        Text(
          'Tap + to add your first password\nand keep your life organized.',
          textAlign: TextAlign.center,
          style: TextStyles.heroSubtitle,
        ),
      ],
    );
  }
}
