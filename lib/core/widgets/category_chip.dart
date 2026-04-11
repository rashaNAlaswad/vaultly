import 'package:flutter/material.dart';

import '../helpers/responsive_helper.dart';
import '../themes/app_colors.dart';
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

  static final _selectedStyle = TextStyles.captionMuted.copyWith(
    color: AppColors.onPrimaryContainer,
  );
  static final _unselectedStyle = TextStyles.captionMuted.copyWith(
    color: AppColors.onSurfaceVariant,
  );

  static final _selectedDecoration = BoxDecoration(
    color: AppColors.primaryContainer,
    borderRadius: BorderRadius.circular(100),
  );
  static final _unselectedDecoration = BoxDecoration(
    color: AppColors.surfaceContainerHigh,
    borderRadius: BorderRadius.circular(100),
  );

  static final _padding = EdgeInsets.symmetric(
    horizontal: 16.w,
    vertical: 8.h,
  );

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$semanticPrefix: $label',
      selected: isSelected,
      button: true,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: _padding,
          decoration: isSelected ? _selectedDecoration : _unselectedDecoration,
          child: Text(
            label,
            style: isSelected ? _selectedStyle : _unselectedStyle,
          ),
        ),
      ),
    );
  }
}
