import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../../l10n/app_localizations.dart';

class SecureVaultBanner extends StatelessWidget {
  const SecureVaultBanner({super.key});

  static final _borderRadius = BorderRadius.circular(16.r);

  static final _contentPadding = EdgeInsets.symmetric(
    horizontal: 20.w,
    vertical: 16.h,
  );

  static final _buttonPadding = EdgeInsets.symmetric(
    horizontal: 14.w,
    vertical: 10.h,
  );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: _borderRadius,
        boxShadow: const [
          BoxShadow(color: AppColors.primaryContainerGlow20, blurRadius: 30),
        ],
      ),
      child: ClipRRect(
        borderRadius: _borderRadius,
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.primaryContainer.withValues(alpha: 0.2),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: _contentPadding,
              child: Row(
                children: [
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.primaryContainer.withValues(
                        alpha: 0.2,
                      ),
                    ),
                    child: Icon(
                      Icons.lock_rounded,
                      color: colorScheme.primary,
                      size: 22,
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l10n.secureVaultTitle, style: TextStyles.screenTitle),
                        4.verticalSpace,
                        Text(
                          l10n.secureVaultSubtitle,
                          style: TextStyles.captionMuted.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
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
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              colorScheme.primary,
                              colorScheme.primaryContainer,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Text(
                          l10n.createPin,
                          textAlign: TextAlign.center,
                          style: TextStyles.captionMuted.copyWith(
                            color: colorScheme.onPrimary,
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
