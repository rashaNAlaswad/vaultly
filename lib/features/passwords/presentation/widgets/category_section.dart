import 'package:flutter/material.dart';
import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/widgets/category_chip.dart';
import '../../../../l10n/app_localizations.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
    required this.tags,
    required this.selected,
    required this.onChanged,
    required this.onAddTag,
  });

  final List<String> tags;
  final String? selected;
  final ValueChanged<String?> onChanged;
  final VoidCallback onAddTag;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.responsive.edgeInsets(start: 4, bottom: 8),
          child: Text(
            l10n.categoryTags,
            style: TextStyles.captionMuted.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
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
  final String? selected;
  final ValueChanged<String?> onChanged;
  final VoidCallback onAddTag;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: [
        ...tags.map(
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
            onTap: onAddTag,
            child: Container(
              padding: context.responsive.edgeInsetsSymmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: colorScheme.outlineVariant,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add_rounded,
                    color: colorScheme.onSurfaceVariant,
                    size: 16.sp,
                  ),
                  4.horizontalSpace,
                  Text(
                    AppLocalizations.of(context).addTagButton,
                    style: TextStyles.captionMuted.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
