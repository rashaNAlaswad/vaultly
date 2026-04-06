import 'package:flutter/material.dart';

import '../../../../../../core/helpers/responsive_helper.dart';
import '../../../../../../core/themes/app_colors.dart';

/// Row of 6 animated indicator dots tracking how many PIN digits are entered.
class PinDotRow extends StatelessWidget {
  const PinDotRow({super.key, required this.filledCount});

  final int filledCount;

  static const int _pinLength = 6;

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = EdgeInsets.symmetric(horizontal: 10.w);
    return Semantics(
      label: '$filledCount of $_pinLength digits entered',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_pinLength, (index) {
          return Padding(
            padding: horizontalPadding,
            child: RepaintBoundary(
              child: _PinDot(
                key: ValueKey(index),
                filled: index < filledCount,
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _PinDot extends StatelessWidget {
  const _PinDot({super.key, required this.filled});

  final bool filled;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      width: 14.w,
      height: 14.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: filled ? AppColors.primary : AppColors.surfaceContainerHighest,
        boxShadow: filled
            ? const [
                BoxShadow(
                  color: AppColors.primaryGlow30,
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ]
            : null,
      ),
    );
  }
}
