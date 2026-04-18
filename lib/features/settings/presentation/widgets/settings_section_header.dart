import 'package:flutter/material.dart';

import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/themes/text_styles.dart';

class SettingsSectionHeader extends StatelessWidget {
  const SettingsSectionHeader({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      spacing: 8,
      children: [
        Icon(icon, color: colorScheme.outlineVariant, size: 20.sp),
        Text(
          title,
          style: TextStyles.screenTitle.copyWith(color: colorScheme.primary),
        ),
      ],
    );
  }
}
