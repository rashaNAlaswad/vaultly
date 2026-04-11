import 'package:flutter/material.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/widgets/category_chip.dart';

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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 8.w,
        children: categories
            .map(
              (category) => CategoryChip(
                label: category,
                isSelected: selected == category,
                onTap: () => onChanged(category),
                semanticPrefix: 'Filter',
              ),
            )
            .toList(),
      ),
    );
  }
}
