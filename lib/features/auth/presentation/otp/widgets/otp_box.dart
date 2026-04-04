import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/text_styles.dart';

/// A single digit input box used in an OTP entry row.
class OtpBox extends StatefulWidget {
  const OtpBox({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hasError,
    required this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool hasError;
  final ValueChanged<String> onChanged;

  @override
  State<OtpBox> createState() => _OtpBoxState();
}

class _OtpBoxState extends State<OtpBox> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final isFocused = widget.focusNode.hasFocus;
    final isFilled = widget.controller.text.isNotEmpty;

    final Color boxColor;
    final Border? border;
    final List<BoxShadow>? shadows;

    if (widget.hasError) {
      boxColor = AppColors.surfaceContainerHigh;
      border = Border.all(color: AppColors.error);
      shadows = const [BoxShadow(color: AppColors.errorGlow20, blurRadius: 10)];
    } else if (isFocused) {
      boxColor = AppColors.surfaceContainerHighest;
      border = Border.all(color: AppColors.primary, width: 2);
      shadows = const [
        BoxShadow(color: AppColors.primaryGlow30, blurRadius: 15),
      ];
    } else if (isFilled) {
      boxColor = AppColors.surfaceContainerHigh;
      border = null;
      shadows = null;
    } else {
      boxColor = AppColors.surfaceContainerLow;
      border = null;
      shadows = null;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      height: 56.h,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(12.r),
        border: border,
        boxShadow: shadows,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Hidden field captures keyboard input
          Opacity(
            opacity: 0,
            child: TextField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: widget.onChanged,
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
                isCollapsed: true,
              ),
            ),
          ),
          if (isFilled)
            Text(widget.controller.text, style: TextStyles.otpDigit)
          else if (isFocused)
            const BlinkingCursor()
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}

/// Animated blinking cursor shown inside a focused, empty [OtpBox].
class BlinkingCursor extends StatelessWidget {
  const BlinkingCursor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 2,
          height: 28.h,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(1.r),
          ),
        )
        .animate(onPlay: (c) => c.repeat(reverse: true))
        .fadeOut(duration: 600.ms, curve: Curves.easeInOut);
  }
}
