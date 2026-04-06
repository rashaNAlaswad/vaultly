import 'package:flutter/material.dart';

import '../../../../../../core/helpers/responsive_helper.dart';
import '../../../../../../core/themes/app_colors.dart';
import '../../../../../../core/themes/text_styles.dart';

/// Numeric keypad for PIN entry (1–9, 0, and backspace).
class PinKeypad extends StatelessWidget {
  const PinKeypad({
    super.key,
    required this.onDigit,
    required this.onBackspace,
  });

  final void Function(int digit) onDigit;
  final VoidCallback onBackspace;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280.w,
      child: Column(
        children: [
          _KeypadRow(digits: const [1, 2, 3], onDigit: onDigit),
          28.verticalSpace,
          _KeypadRow(digits: const [4, 5, 6], onDigit: onDigit),
          28.verticalSpace,
          _KeypadRow(digits: const [7, 8, 9], onDigit: onDigit),
          28.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 64.w, height: 56.h),
              _DigitButton(digit: 0, onDigit: onDigit),
              _BackspaceButton(onTap: onBackspace),
            ],
          ),
        ],
      ),
    );
  }
}

class _KeypadRow extends StatelessWidget {
  const _KeypadRow({required this.digits, required this.onDigit});

  final List<int> digits;
  final void Function(int) onDigit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: digits
          .map((d) => _DigitButton(digit: d, onDigit: onDigit))
          .toList(),
    );
  }
}

/// Shared press-state widget to avoid duplicating StatefulWidget logic.
class _PressableButton extends StatefulWidget {
  const _PressableButton({
    required this.onTap,
    required this.semanticsLabel,
    required this.child,
  });

  final VoidCallback onTap;
  final String semanticsLabel;
  final Widget child;

  @override
  State<_PressableButton> createState() => _PressableButtonState();
}

class _PressableButtonState extends State<_PressableButton> {
  final _pressed = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _pressed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.semanticsLabel,
      child: GestureDetector(
        onTapDown: (_) => _pressed.value = true,
        onTapUp: (_) {
          _pressed.value = false;
          widget.onTap();
        },
        onTapCancel: () => _pressed.value = false,
        child: RepaintBoundary(
          child: ValueListenableBuilder<bool>(
            valueListenable: _pressed,
            builder: (_, pressed, child) => AnimatedScale(
              scale: pressed ? 0.88 : 1.0,
              duration: const Duration(milliseconds: 100),
              child: child,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class _DigitButton extends StatelessWidget {
  const _DigitButton({required this.digit, required this.onDigit});

  final int digit;
  final void Function(int) onDigit;

  @override
  Widget build(BuildContext context) {
    return _PressableButton(
      onTap: () => onDigit(digit),
      semanticsLabel: digit.toString(),
      child: SizedBox(
        width: 64.w,
        height: 56.h,
        child: Center(
          child: Text(digit.toString(), style: TextStyles.largeText),
        ),
      ),
    );
  }
}

class _BackspaceButton extends StatelessWidget {
  const _BackspaceButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _PressableButton(
      onTap: onTap,
      semanticsLabel: 'Delete last digit',
      child: SizedBox(
        width: 64.w,
        height: 56.h,
        child: Center(
          child: Icon(
            Icons.backspace_outlined,
            color: AppColors.onSurfaceVariant,
            size: 24.w,
          ),
        ),
      ),
    );
  }
}
