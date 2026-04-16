import 'package:flutter/material.dart';

import '../../../../../../core/helpers/responsive_helper.dart';
import '../../../../../../core/themes/text_styles.dart';

class PinHeroSection extends StatelessWidget {
  const PinHeroSection({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Container(
          width: 64.w,
          height: 64.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [colorScheme.primary, colorScheme.primaryContainer],
            ),
            boxShadow: [
              BoxShadow(
                color: colorScheme.primaryContainer.withValues(alpha: 0.2),
                blurRadius: 30,
                spreadRadius: 4,
              ),
            ],
          ),
          child: Icon(
            Icons.shield_rounded,
            color: colorScheme.onPrimary,
            size: 30.w,
            semanticLabel: 'Security shield',
          ),
        ),
        20.verticalSpace,
        Text(title, style: TextStyles.largeText),
        12.verticalSpace,
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyles.heroSubtitle.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
