import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import 'otp_box.dart';

/// A row of [OtpBox] widgets that together form the 6-digit OTP input.
class OtpInputRow extends StatelessWidget {
  const OtpInputRow({
    super.key,
    required this.controllers,
    required this.focusNodes,
    required this.hasError,
    required this.onChanged,
  });

  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final bool hasError;
  final void Function(String value, int index) onChanged;

  @override
  Widget build(BuildContext context) {
    final length = controllers.length;
    return Semantics(
      label: 'Enter $length-digit verification code',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(length, (i) {
          return Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.only(end: i < length - 1 ? 8.w : 0),
              child: OtpBox(
                controller: controllers[i],
                focusNode: focusNodes[i],
                hasError: hasError,
                onChanged: (v) => onChanged(v, i),
              ),
            ),
          );
        }),
      ),
    ).animate().fadeIn(delay: 300.ms, duration: 600.ms);
  }
}
