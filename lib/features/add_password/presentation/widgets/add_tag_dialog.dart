import 'package:flutter/material.dart';

import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/app_text_field.dart';

class AddTagDialog extends StatelessWidget {
  const AddTagDialog({super.key, required this.controller});

  final TextEditingController controller;

  static Future<String?> show(BuildContext context) async {
    final controller = TextEditingController();
    final confirmed = await Utils.showDefaultDialog(
      context,
      AddTagDialog(controller: controller),
      const _AddTagActions(),
      false,
    );
    final tag = confirmed == true ? controller.text.trim() : null;
    return (tag == null || tag.isEmpty) ? null : tag;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Add Tag', style: TextStyles.screenTitle),
        16.verticalSpace,
        AppTextField(
          controller: controller,
          hint: 'e.g. Gaming',
          label: 'Tag Name',
          autofocus: true,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => Navigator.of(context).pop(true),
        ),
      ],
    );
  }
}

class _AddTagActions extends StatelessWidget {
  const _AddTagActions();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Add'),
        ),
      ],
    );
  }
}
