import 'package:flutter/material.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/models/password_strength.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../l10n/app_localizations.dart';
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

  static final _usernameStyle = TextStyles.captionMuted.copyWith(
    color: AppColors.outline,
  );

  static final _deleteTextStyle = TextStyles.captionMuted.copyWith(
    color: AppColors.error,
  );

  static final _cardDecoration = BoxDecoration(
    color: AppColors.surfaceContainerLow,
    borderRadius: BorderRadius.circular(12.r),
  );

  static final _cardPadding = EdgeInsets.symmetric(
    horizontal: 16.w,
    vertical: 16.h,
  );

  String get _avatarLetter =>
      entry.siteName.isNotEmpty ? entry.siteName[0].toUpperCase() : '?';

  Future<void> _confirmDelete(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await Utils.showDefaultDialog(
      context,
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.deletePasswordTitle, style: TextStyles.screenTitle),
          8.verticalSpace,
          Text(
            l10n.deletePasswordConfirmMessage(entry.siteName),
            style: TextStyles.captionMuted,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.delete, style: _deleteTextStyle),
          ),
        ],
      ),
      false,
    );
    if (confirmed == true) onDelete();
  }

  @override
  Widget build(BuildContext context) {
    final strength = evaluateStrength(entry.password) ?? PasswordStrength.weak;

    return Semantics(
      label: 'Password entry for ${entry.siteName}',
      button: true,
      child: GestureDetector(
        onTap: onTap,
        onLongPress: () => _confirmDelete(context),
        child: Container(
          padding: _cardPadding,
          decoration: _cardDecoration,
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
                      style: _usernameStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              16.horizontalSpace,
              _StrengthIndicator(strength: strength),
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

  static final _letterStyle = TextStyles.screenTitle.copyWith(
    color: AppColors.onPrimary,
  );

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
        child: Text(letter, style: _letterStyle),
      ),
    );
  }
}

class _StrengthIndicator extends StatelessWidget {
  const _StrengthIndicator({required this.strength});

  final PasswordStrength strength;

  @override
  Widget build(BuildContext context) {
    final activeColor = strength.color;
    final activeDots = strength.filledDots;
    final l10n = AppLocalizations.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) {
            final active = i < activeDots;
            return Padding(
              padding: context.responsive.edgeInsets(start: i == 0 ? 0 : 4),
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
          strength.label(l10n),
          style: TextStyles.captionPrimary.copyWith(
            fontSize: 10.sp,
            color: activeColor,
          ),
        ),
      ],
    );
  }
}
