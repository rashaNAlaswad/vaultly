import 'package:flutter/material.dart';

import '../../../../../core/constants/vault_categories.dart';
import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../../core/widgets/category_chip.dart';

class CategoryTagRow extends StatelessWidget {
  const CategoryTagRow({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final String selected;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: [
        ...kVaultCategories.map(
          (tag) => CategoryChip(
            label: tag,
            isSelected: selected == tag,
            onTap: () => onChanged(tag),
            semanticPrefix: 'Tag',
          ),
        ),
        Semantics(
          label: 'Add new tag',
          button: true,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: context.responsive.edgeInsetsSymmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: AppColors.outlineVariant, width: 1),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add_rounded,
                    color: AppColors.onSurfaceVariant,
                    size: 16.sp,
                  ),
                  4.horizontalSpace,
                  Text('Add Tag', style: TextStyles.captionMuted),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
