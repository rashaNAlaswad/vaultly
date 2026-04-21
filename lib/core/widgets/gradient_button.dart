import 'package:flutter/material.dart';

import '../helpers/responsive_helper.dart';
import '../themes/text_styles.dart';

/// A reusable gradient button used across the app.
///
/// Displays a full-width button with an optional trailing icon, animated
/// press feedback, and enabled/disabled visual states. The button slightly
/// scales down while pressed and restores its size on release.
class GradientButton extends StatefulWidget {
  const GradientButton({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.enabled = true,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final bool enabled;
  final bool isLoading;

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  final _pressed = ValueNotifier<bool>(false);

  static final _contentPadding = EdgeInsets.symmetric(vertical: 20.h);

  bool get _interactive => widget.enabled && !widget.isLoading;

  @override
  void dispose() {
    _pressed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final enabledDecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [colorScheme.primary, colorScheme.primaryContainer],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: [
        BoxShadow(
          color: colorScheme.primaryContainer.withValues(alpha: 0.4),
          blurRadius: 25,
          offset: const Offset(0, 8),
        ),
      ],
    );

    final disabledDecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [
          colorScheme.surfaceContainerHigh,
          colorScheme.surfaceContainerHighest,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(12.r),
    );

    return Semantics(
      label: widget.label,
      button: true,
      enabled: widget.enabled,
      child: GestureDetector(
        onTapDown: _interactive ? (_) => _pressed.value = true : null,
        onTapUp: _interactive
            ? (_) {
                _pressed.value = false;
                widget.onTap();
              }
            : null,
        onTapCancel: _interactive ? () => _pressed.value = false : null,
        child: RepaintBoundary(
          child: ValueListenableBuilder<bool>(
            valueListenable: _pressed,
            builder: (_, pressed, child) => AnimatedScale(
              scale: pressed ? 0.97 : 1.0,
              duration: const Duration(milliseconds: 100),
              child: child,
            ),
            child: widget.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    width: double.infinity,
                    padding: _contentPadding,
                    decoration: widget.enabled
                        ? enabledDecoration
                        : disabledDecoration,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.label,
                          style: widget.enabled
                              ? TextStyles.buttonLabel.copyWith(
                                  color: colorScheme.onPrimary,
                                )
                              : TextStyles.buttonLabelDisabled.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                        ),
                        if (widget.icon != null) ...[
                          12.horizontalSpace,
                          Icon(
                            widget.icon,
                            color: widget.enabled
                                ? colorScheme.onPrimary
                                : colorScheme.onSurfaceVariant,
                            size: 20,
                          ),
                        ],
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
