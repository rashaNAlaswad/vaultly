import 'package:flutter/material.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/widgets/app_text_field.dart';

class VaultSearchBar extends StatelessWidget {
  const VaultSearchBar({
    super.key,
    required this.controller,
    this.onChanged,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Search your vault',
      textField: true,
      child: AppTextField(
        controller: controller,
        hint: 'Search your vault',
        onChanged: onChanged,
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: AppColors.onSurfaceVariant,
          size: 20,
        ),
        textInputAction: TextInputAction.search,
      ),
    );
  }
}
