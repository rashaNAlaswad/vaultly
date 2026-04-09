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

  bool get _interactive => widget.enabled && !widget.isLoading;

  @override
  void dispose() {
    _pressed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
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
            child:widget.isLoading
                  ? Center(child: CircularProgressIndicator()) 
                  : Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              decoration: decoration,
              child: 
                  AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: Row(
                        key: const ValueKey('label'),
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
        ),
      ),
    );
  }
}
