import 'package:flutter/material.dart';

import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/utils/utils.dart';
import 'settings_icon_avatar.dart';

class SettingsDangerCard extends StatelessWidget {
  const SettingsDangerCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.confirmTitle,
    required this.confirmMessage,
    required this.onConfirmed,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String confirmTitle;
  final String confirmMessage;
  final VoidCallback onConfirmed;

  Future<void> _showConfirmation(BuildContext context) async {
    final confirmed = await Utils.showDefaultDialog(
      context,
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            confirmTitle,
            style: TextStyles.largeText.copyWith(color: AppColors.error),
          ),
          8.verticalSpace,
          Text(confirmMessage, style: TextStyles.captionMuted),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel', style: TextStyles.captionMuted),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              'Confirm',
              style: TextStyles.captionMuted.copyWith(color: AppColors.error),
            ),
          ),
        ],
      ),
      false,
    );
    if (confirmed == true) onConfirmed();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: title,
      child: Material(
        color: AppColors.errorContainer.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
        child: InkWell(
          onTap: () => _showConfirmation(context),
          borderRadius: BorderRadius.circular(12.r),
          child: Padding(
            padding: context.responsive.edgeInsets(all: 20),
            child: Row(
              children: [
                SettingsIconAvatar(
                  icon: icon,
                  backgroundColor: AppColors.errorContainer.withValues(
                    alpha: 0.3,
                  ),
                  iconColor: AppColors.error,
                ),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyles.screenTitle.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.error,
                        ),
                      ),
                      4.verticalSpace,
                      Text(
                        subtitle,
                        style: TextStyles.captionMuted.copyWith(
                          color: AppColors.error.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.warning_rounded,
                  color: AppColors.error.withValues(alpha: 0.4),
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
