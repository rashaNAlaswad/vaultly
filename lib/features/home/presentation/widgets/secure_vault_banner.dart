import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../core/routing/app_routes.dart';

class SecureVaultBanner extends StatelessWidget {
  const SecureVaultBanner({super.key});

  static final _outerDecoration = BoxDecoration(
    color: AppColors.surfaceContainerLow,
    borderRadius: BorderRadius.circular(16.r),
    boxShadow: const [
      BoxShadow(color: AppColors.primaryContainerGlow20, blurRadius: 30),
    ],
  );

  static final _borderRadius = BorderRadius.circular(16.r);

  static const _gradientOverlayDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [AppColors.primaryContainerGlow20, Colors.transparent],
    ),
  );

  static final _contentPadding = EdgeInsets.symmetric(
    horizontal: 20.w,
    vertical: 16.h,
  );

  static final _buttonDecoration = BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [AppColors.primary, AppColors.primaryContainer],
    ),
    borderRadius: BorderRadius.circular(100.r),
  );

  static final _buttonPadding = EdgeInsets.symmetric(
    horizontal: 14.w,
    vertical: 10.h,
  );

  static final _buttonTextStyle = TextStyles.captionMuted.copyWith(
    color: AppColors.onPrimary,
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _outerDecoration,
      child: ClipRRect(
        borderRadius: _borderRadius,
        child: Stack(
          children: [
            const Positioned.fill(
              child: DecoratedBox(decoration: _gradientOverlayDecoration),
            ),
            Padding(
              padding: _contentPadding,
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
                        Text('Secure your vault', style: TextStyles.screenTitle),
                        4.verticalSpace,
                        Text(
                          'Create a PIN to encrypt your passwords',
                          style: TextStyles.captionMuted,
                        ),
                      ],
                    ),
                  ),
                  12.horizontalSpace,
                  Semantics(
                    label: 'Create PIN',
                    button: true,
                    child: GestureDetector(
                      onTap: () => context.push(AppRoutes.pinCreate),
                      child: Container(
                        padding: _buttonPadding,
                        decoration: _buttonDecoration,
                        child: Text(
                          'Create\nPIN',
                          textAlign: TextAlign.center,
                          style: _buttonTextStyle,
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
