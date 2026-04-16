import 'package:flutter/material.dart';

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
    final colorScheme = Theme.of(context).colorScheme;
    return Semantics(
      label: 'Search your vault',
      textField: true,
      child: AppTextField(
        controller: controller,
        hint: 'Search your vault',
        onChanged: onChanged,
        prefixIcon: Icon(
          Icons.search_rounded,
          color: colorScheme.onSurfaceVariant,
          size: 20,
        ),
        textInputAction: TextInputAction.search,
      ),
    );
  }
}
