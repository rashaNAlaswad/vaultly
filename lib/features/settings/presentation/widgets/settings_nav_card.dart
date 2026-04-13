import 'package:flutter/material.dart';

import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/text_styles.dart';
import 'settings_icon_avatar.dart';

class SettingsNavCard extends StatelessWidget {
  const SettingsNavCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: title,
      child: Material(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.r),
          child: Padding(
            padding: context.responsive.edgeInsets(all: 20),
            child: Row(
              children: [
                SettingsIconAvatar(
                  icon: icon,
                  backgroundColor: AppColors.surfaceContainerHighest,
                  iconColor: AppColors.onSurfaceVariant,
                ),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyles.screenTitle.copyWith(fontSize: 14.sp),
                      ),
                      4.verticalSpace,
                      Text(subtitle, style: TextStyles.captionMuted),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.outline.withValues(alpha: 0.4),
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
