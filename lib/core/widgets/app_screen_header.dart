import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../helpers/responsive_helper.dart';
import '../themes/app_colors.dart';
import '../themes/text_styles.dart';

/// App-wide top bar — back button + title + optional trailing action.
///
/// Use [trailing] to place a text button or icon on the right (e.g. "Save").
/// [onBack] defaults to [GoRouter.pop] when omitted.
class AppScreenHeader extends StatelessWidget {
  const AppScreenHeader({
    super.key,
    required this.title,
    this.onBack,
    this.trailing,
  });

  final String title;

  /// Called when the back button is tapped. Defaults to `context.pop()`.
  final VoidCallback? onBack;

  /// Optional widget placed at the trailing edge (e.g. a "Save" button).
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.responsive.edgeInsetsSymmetric(horizontal: 8),
      child: Row(
        children: [
          Semantics(
            label: 'Go back',
            button: true,
            child: IconButton(
              onPressed: onBack ?? () => context.pop(),
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: AppColors.onSurface,
                size: 24,
              ),
            ),
          ),
          Expanded(child: Text(title, style: TextStyles.screenTitle)),
          trailing ?? const SizedBox(width: 48),
        ],
      ),
    );
  }
}
