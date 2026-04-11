import 'package:flutter/material.dart';
import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/text_styles.dart';

import '../../../../core/widgets/category_chip.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
    required this.tags,
    required this.selected,
    required this.onChanged,
    required this.onAddTag,
  });

  final List<String> tags;
  final List<String> selected;
  final ValueChanged<List<String>> onChanged;
  final VoidCallback onAddTag;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.responsive.edgeInsets(left: 4, bottom: 8),
          child: Text('Category Tags', style: TextStyles.captionMuted),
        ),

        _CategoryTagRow(
          tags: tags,
          selected: selected,
          onChanged: onChanged,
          onAddTag: onAddTag,
        ),
      ],
    );
  }
}

class _CategoryTagRow extends StatelessWidget {
  const _CategoryTagRow({
    required this.tags,
    required this.selected,
    required this.onChanged,
    required this.onAddTag,
  });

  final List<String> tags;
  final List<String> selected;
  final ValueChanged<List<String>> onChanged;
  final VoidCallback onAddTag;

  void _toggle(String tag) {
    final updated = List<String>.from(selected);
    if (updated.contains(tag)) {
      updated.remove(tag);
    } else {
      updated.add(tag);
    }
    onChanged(updated);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: [
        ...tags.map(
          (tag) => CategoryChip(
            label: tag,
            isSelected: selected.contains(tag),
            onTap: () => _toggle(tag),
            semanticPrefix: 'Tag',
          ),
        ),
        Semantics(
          label: 'Add new tag',
          button: true,
          child: GestureDetector(
            onTap: onAddTag,
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
