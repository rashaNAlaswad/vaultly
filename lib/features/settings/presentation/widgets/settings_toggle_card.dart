import 'package:flutter/material.dart';

import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/themes/text_styles.dart';
import 'settings_icon_avatar.dart';

class SettingsToggleCard extends StatelessWidget {
  const SettingsToggleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: context.responsive.edgeInsets(all: 20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          SettingsIconAvatar(
            icon: icon,
            backgroundColor: colorScheme.surfaceContainerHighest,
            iconColor: colorScheme.onSurfaceVariant,
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
                Text(
                  subtitle,
                  style: TextStyles.captionMuted.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Semantics(
            label: title,
            toggled: value,
            excludeSemantics: true,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
