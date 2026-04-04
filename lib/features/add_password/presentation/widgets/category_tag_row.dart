import 'package:flutter/material.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/text_styles.dart';

const _kTags = ['Social', 'Work', 'Finance'];

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
        ..._kTags.map(
          (tag) => Semantics(
            label: 'Tag: $tag',
            selected: selected == tag,
            button: true,
            child: GestureDetector(
              onTap: () => onChanged(tag),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: context.responsive.edgeInsetsSymmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: selected == tag
                      ? AppColors.primaryContainer
                      : AppColors.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  tag,
                  style: TextStyles.captionMuted.copyWith(
                    color: selected == tag
                        ? AppColors.onPrimaryContainer
                        : AppColors.onSurfaceVariant,
                  ),
                ),
              ),
            ),
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
