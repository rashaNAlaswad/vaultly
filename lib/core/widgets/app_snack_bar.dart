import 'package:flutter/material.dart';
import 'package:vaultly/core/helpers/responsive_helper.dart';

import '../themes/app_colors.dart';

/// Global snack bar helper.
///
/// Usage:
///   AppSnackBar.error(context, 'Something went wrong');
///   AppSnackBar.info(context, 'Create a PIN first');
///   AppSnackBar.success(context, 'Saved successfully');
abstract final class AppSnackBar {
  static void error(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 4),
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    _show(
      context,
      message: message,
      duration: duration,
      backgroundColor: colorScheme.errorContainer,
      foregroundColor: colorScheme.onErrorContainer,
      icon: Icons.error_outline_rounded,
    );
  }

  static void info(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 4),
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    _show(
      context,
      message: message,
      duration: duration,
      backgroundColor: colorScheme.surfaceContainerHigh,
      foregroundColor: colorScheme.onSurface,
      icon: Icons.info_outline_rounded,
    );
  }

  static void success(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) => _show(
    context,
    message: message,
    duration: duration,
    backgroundColor: AppColors.success,
    foregroundColor: Colors.white,
    icon: Icons.check_circle_outline_rounded,
  );

  static void _show(
    BuildContext context, {
    required String message,
    required Duration duration,
    required Color backgroundColor,
    required Color foregroundColor,
    required IconData icon,
  }) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger == null) return;
    messenger
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          duration: duration,
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: Row(
            children: [
              Icon(icon, color: foregroundColor, size: 18),
              10.horizontalSpace,
              Expanded(
                child: Text(message, style: TextStyle(color: foregroundColor)),
              ),
            ],
          ),
        ),
      );
  }
}
