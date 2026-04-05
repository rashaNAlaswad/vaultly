import 'package:flutter/material.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/text_styles.dart';

class SecureVaultBanner extends StatelessWidget {
  const SecureVaultBanner({super.key, required this.onCreatePin});

  final VoidCallback onCreatePin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(color: AppColors.primaryContainerGlow20, blurRadius: 30),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primaryContainerGlow20,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: context.responsive.edgeInsetsSymmetric(
                horizontal: 20,
                vertical: 16,
              ),
              child: Row(
                children: [
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryContainerGlow20,
                    ),
                    child: const Icon(
                      Icons.lock_rounded,
                      color: AppColors.primary,
                      size: 22,
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Secure your vault',
                          style: TextStyles.screenTitle,
                        ),
                        4.verticalSpace,
                        Text(
                          'Create a PIN to encrypt your passwords',
                          style: TextStyles.captionMuted,
                        ),
                      ],
                    ),
                  ),
                  12.horizontalSpace,
                  // Create PIN button
                  Semantics(
                    label: 'Create PIN',
                    button: true,
                    child: GestureDetector(
                      onTap: onCreatePin,
                      child: Container(
                        padding: context.responsive.edgeInsetsSymmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.primary,
                              AppColors.primaryContainer,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Text(
                          'Create\nPIN',
                          textAlign: TextAlign.center,
                          style: TextStyles.captionMuted.copyWith(
                            color: AppColors.onPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
