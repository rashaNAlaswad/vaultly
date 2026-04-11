import 'package:flutter/material.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../../core/models/password_strength.dart';
import '../../../../../core/utils/utils.dart';
import '../../../add_password/data/models/password_entry.dart';

class PasswordCard extends StatelessWidget {
  const PasswordCard({
    super.key,
    required this.entry,
    required this.onDelete,
    required this.onTap,
  });

  final PasswordEntry entry;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  String get _avatarLetter =>
      entry.siteName.isNotEmpty ? entry.siteName[0].toUpperCase() : '?';

  Future<void> _confirmDelete(BuildContext context) async {
    final confirmed = await Utils.showDefaultDialog(
      context,
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Delete password?', style: TextStyles.screenTitle),
          8.verticalSpace,
          Text(
            'Remove "${entry.siteName}" from your vault?',
            style: TextStyles.captionMuted,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Delete', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
      false,
    );
    if (confirmed == true) onDelete();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Password entry for ${entry.siteName}',
      button: true,
      child: GestureDetector(
        onTap: onTap,
        onLongPress: () => _confirmDelete(context),
        child: Container(
          padding: context.responsive.edgeInsets(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              _SiteAvatar(letter: _avatarLetter),
              16.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.siteName,
                      style: TextStyles.screenTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    4.verticalSpace,
                    Text(
                      entry.username,
                      style: TextStyles.captionMuted.copyWith(
                        color: AppColors.outline,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              16.horizontalSpace,
              _StrengthIndicator(password: entry.password),
            ],
          ),
        ),
      ),
    );
  }
}

class _SiteAvatar extends StatelessWidget {
  const _SiteAvatar({required this.letter});

  final String letter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height: 48.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary,
      ),
      child: Center(
        child: Text(
          letter,
          style: TextStyles.screenTitle.copyWith(color: AppColors.onPrimary),
        ),
      ),
    );
  }
}

class _StrengthIndicator extends StatelessWidget {
  const _StrengthIndicator({required this.password});

  final String password;

  @override
  Widget build(BuildContext context) {
    final strength = evaluateStrength(password) ?? PasswordStrength.weak;
    final activeColor = strength.color;
    final activeDots = strength.filledDots;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) {
            final active = i < activeDots;
            return Padding(
              padding: context.responsive.edgeInsets(left: i == 0 ? 0 : 4),
              child: Container(
                width: 6.w,
                height: 6.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: active
                      ? activeColor
                      : AppColors.surfaceContainerHighest,
                ),
              ),
            );
          }),
        ),
        4.verticalSpace,
        Text(
          strength.label,
          style: TextStyles.captionPrimary.copyWith(
            fontSize: 10.sp,
            color: activeColor,
          ),
        ),
      ],
    );
  }
}
