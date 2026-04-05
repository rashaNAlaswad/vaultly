import 'package:flutter/material.dart';

import '../../../../../core/constants/vault_categories.dart';
import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/widgets/category_chip.dart';

const _kCategories = ['All', ...kVaultCategories];

class HomeCategoryFilterRow extends StatelessWidget {
  const HomeCategoryFilterRow({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final String selected;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _kCategories
            .map(
              (category) => Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: CategoryChip(
                  label: category,
                  isSelected: selected == category,
                  onTap: () => onChanged(category),
                  semanticPrefix: 'Filter',
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
