import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/extensions/animations.dart';
import '../../../../../../core/helpers/responsive_helper.dart';
import '../../../../../../core/themes/app_colors.dart';
import '../pin_setup_provider.dart';
import '../strategies/pin_strategy.dart';

/// Row of 6 animated indicator dots tracking how many PIN digits are entered.
class PinDotRow extends StatelessWidget {
  const PinDotRow({super.key, required this.filledCount});

  final int filledCount;

  static const int _pinLength = 6;
  static final _dotPadding = EdgeInsets.symmetric(horizontal: 10.w);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$filledCount of $_pinLength digits entered',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_pinLength, (index) {
          return Padding(
            padding: _dotPadding,
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

/// Riverpod-connected dot row that watches [PinNotifier] digit count.
class PinConnectedDotRow extends ConsumerWidget {
  const PinConnectedDotRow({super.key, required this.strategy});

  final PinStrategy strategy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final length = ref.watch(pinProvider(strategy).select((s) => s.length));
    return PinDotRow(filledCount: length).fadeInSlide(delay: 100);
  }
}

class _PinDot extends StatelessWidget {
  const _PinDot({super.key, required this.filled});

  final bool filled;

  static final _filledDecoration = BoxDecoration(
    shape: BoxShape.circle,
    color: AppColors.primary,
    boxShadow: const [
      BoxShadow(color: AppColors.primaryGlow30, blurRadius: 12, spreadRadius: 2),
    ],
  );

  static const _emptyDecoration = BoxDecoration(
    shape: BoxShape.circle,
    color: AppColors.surfaceContainerHighest,
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      width: 14.w,
      height: 14.w,
      decoration: filled ? _filledDecoration : _emptyDecoration,
    );
  }
}
