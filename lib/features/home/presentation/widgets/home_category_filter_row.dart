import 'package:flutter/material.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/widgets/category_chip.dart';
import '../../../../../l10n/app_localizations.dart';

class HomeCategoryFilterRow extends StatelessWidget {
  const HomeCategoryFilterRow({
    super.key,
    required this.categories,
    required this.selected,
    required this.onChanged,
  });

  final List<String> categories;
  final String selected;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SizedBox(
      height: 36.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: CategoryChip(
              label: category == 'All' ? l10n.all : category,
              isSelected: selected == category,
              onTap: () => onChanged(category),
              semanticPrefix: 'Filter',
            ),
          );
        },
      ),
    );
  }
}
