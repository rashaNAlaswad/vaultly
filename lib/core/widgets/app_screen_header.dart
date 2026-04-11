import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../helpers/responsive_helper.dart';
import '../themes/app_colors.dart';
import '../themes/text_styles.dart';

/// App-wide top bar — back button + title + optional trailing action.
///
/// Use [trailing] to place a text button or icon on the right (e.g. "Save").
/// Use [titleWidget] to override the default [Text] title with a custom widget
/// (e.g. gradient text). When both [title] and [titleWidget] are provided,
/// [titleWidget] takes precedence.
/// [onBack] defaults to [GoRouter.pop] when omitted.
class AppScreenHeader extends StatelessWidget {
  const AppScreenHeader({
    super.key,
    this.title,
    this.titleWidget,
    this.onBack,
    this.trailing,
    this.showBackButton = true,
  }) : assert(
         title != null || titleWidget != null,
         'Provide either title or titleWidget',
       );

  final String? title;

  /// Optional custom title widget — takes precedence over [title].
  final Widget? titleWidget;

  /// Called when the back button is tapped. Defaults to `context.pop()`.
  final VoidCallback? onBack;

  /// Optional widget placed at the trailing edge (e.g. a "Save" button).
  final Widget? trailing;

  /// Whether to show the leading back button. Defaults to `true`.
  final bool showBackButton;

  static final _padding = EdgeInsets.symmetric(horizontal: 8.w);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding,
      child: Row(
        children: [
          showBackButton
              ? Semantics(
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
                )
              : const SizedBox(width: 20),
          Expanded(
            child: titleWidget ?? Text(title!, style: TextStyles.screenTitle),
          ),
          trailing ?? const SizedBox(width: 48),
        ],
      ),
    );
  }
}
