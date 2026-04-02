import 'package:flutter/material.dart';

import '../helpers/responsive_helper.dart';
import '../themes/app_colors.dart';
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
  });

  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final bool enabled;

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.label,
      button: true,
      enabled: widget.enabled,
      child: GestureDetector(
        onTapDown: widget.enabled
            ? (_) => setState(() => _pressed = true)
            : null,
        onTapUp: widget.enabled
            ? (_) {
                setState(() => _pressed = false);
                widget.onTap();
              }
            : null,
        onTapCancel: () => setState(() => _pressed = false),
        child: AnimatedScale(
          scale: _pressed ? 0.97 : 1.0,
          duration: const Duration(milliseconds: 100),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: widget.enabled
                    ? [AppColors.primary, AppColors.primaryContainer]
                    : [
                        AppColors.surfaceContainerHigh,
                        AppColors.surfaceContainerHighest,
                      ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: widget.enabled
                  ? const [
                      BoxShadow(
                        color: AppColors.primaryContainerGlow40,
                        blurRadius: 25,
                        offset: Offset(0, 8),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.label,
                  style: widget.enabled
                      ? TextStyles.buttonLabel
                      : TextStyles.buttonLabelDisabled,
                ),
                if (widget.icon != null) ...[
                  12.horizontalSpace,
                  Icon(
                    widget.icon,
                    color: widget.enabled
                        ? AppColors.onPrimary
                        : AppColors.subtleText,
                    size: 20,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
