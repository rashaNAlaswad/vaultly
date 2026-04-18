import 'package:flutter/material.dart';

import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/themes/text_styles.dart';
import 'settings_icon_avatar.dart';

class SettingsNavCard extends StatelessWidget {
  const SettingsNavCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.enabled = true,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Semantics(
      button: true,
      enabled: enabled,
      label: title,
      child: Opacity(
        opacity: enabled ? 1.0 : 0.55,
        child: Material(
          color: colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(12.r),
          child: InkWell(
            onTap: enabled ? onTap : null,
            borderRadius: BorderRadius.circular(12.r),
            child: Padding(
              padding: context.responsive.edgeInsets(all: 20),
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
                          style: TextStyles.screenTitle.copyWith(
                            fontSize: 14.sp,
                          ),
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
                  Icon(
                    Icons.chevron_right_rounded,
                    color: colorScheme.outline.withValues(alpha: 0.4),
                    size: 20.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
