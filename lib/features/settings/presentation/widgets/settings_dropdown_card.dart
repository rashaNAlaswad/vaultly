import 'package:flutter/material.dart';

import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/themes/text_styles.dart';
import 'settings_icon_avatar.dart';

class SettingsDropdownCard<T> extends StatelessWidget {
  const SettingsDropdownCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final T value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

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
            excludeSemantics: true,
            child: DropdownButton<T>(
              value: value,
              items: items,
              onChanged: onChanged,
              underline: const SizedBox.shrink(),
              dropdownColor: colorScheme.surfaceContainerHigh,
              style: TextStyles.screenTitle.copyWith(fontSize: 13.sp),
              icon: Icon(
                Icons.arrow_drop_down_rounded,
                color: colorScheme.onSurfaceVariant,
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
