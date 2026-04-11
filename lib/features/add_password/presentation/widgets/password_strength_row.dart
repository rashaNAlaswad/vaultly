import 'package:flutter/material.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/models/password_strength.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';

/// 3-dot animated strength bar with label and regenerate button.
class PasswordStrengthRow extends StatelessWidget {
  const PasswordStrengthRow({
    super.key,
    required this.password,
    required this.onRegenerate,
  });

  final String password;
  final VoidCallback onRegenerate;

  @override
  Widget build(BuildContext context) {
    final strength = evaluateStrength(password);
    if (strength == null) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context);
    return Semantics(
      label: 'Password strength: ${strength.label(l10n)}',
      child: Padding(
        padding: context.responsive.edgeInsetsSymmetric(horizontal: 4),
        child: Column(
          children: [
            Row(
              children: List.generate(3, (i) {
                final isActive = i < strength.filledDots;
                return Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: EdgeInsetsDirectional.only(end: i < 2 ? 4.w : 0),
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: isActive
                          ? strength.color
                          : AppColors.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: isActive
                          ? [
                              BoxShadow(
                                color: strength.glowColor,
                                blurRadius: 8,
                              ),
                            ]
                          : null,
                    ),
                  ),
                );
              }),
            ),
            8.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  strength.label(l10n),
                  style: TextStyles.fieldLabel.copyWith(color: strength.color),
                ),
                Semantics(
                  label: 'Regenerate password',
                  button: true,
                  child: GestureDetector(
                    onTap: onRegenerate,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.refresh_rounded,
                          color: AppColors.primary,
                          size: 14.sp,
                        ),
                        4.horizontalSpace,
                        Text(l10n.regenerate, style: TextStyles.captionPrimary),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
