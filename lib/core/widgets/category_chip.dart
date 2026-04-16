import 'package:flutter/material.dart';

import '../helpers/responsive_helper.dart';
import '../themes/text_styles.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.semanticPrefix = 'Category',
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final String semanticPrefix;

  static final _padding = EdgeInsets.symmetric(
    horizontal: 16.w,
    vertical: 8.h,
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final style = TextStyles.captionMuted.copyWith(
      color: isSelected
          ? colorScheme.onPrimaryContainer
          : colorScheme.onSurfaceVariant,
    );

    final decoration = BoxDecoration(
      color: isSelected
          ? colorScheme.primaryContainer
          : colorScheme.surfaceContainerHigh,
      borderRadius: BorderRadius.circular(100),
    );

    return Semantics(
      label: '$semanticPrefix: $label',
      selected: isSelected,
      button: true,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: _padding,
          decoration: decoration,
          child: Text(
            label,
            style: style,
          ),
        ),
      ),
    );
  }
}
