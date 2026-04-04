import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/routing/app_routes.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/widgets/gradient_button.dart';
import '../../../providers/auth_providers.dart';
import '../../widgets/ambient_blob.dart';
import '../widgets/go_back_widget.dart';
import '../widgets/instruction_header.dart';
import '../widgets/otp_actions.dart';
import '../widgets/otp_error_message.dart';
import '../widgets/otp_input_row.dart';

class OtpVerificationScreen extends ConsumerStatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});

  final String email;

  @override
  ConsumerState<OtpVerificationScreen> createState() =>
      _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends ConsumerState<OtpVerificationScreen> {
  static const _otpLength = 6;

  final _controllers = List.generate(
    _otpLength,
    (_) => TextEditingController(),
  );

  final _focusNodes = List.generate(_otpLength, (_) => FocusNode());

  final _resendSeconds = ValueNotifier<int>(58);
  String _currentOtp = '';
  Timer? _resendTimer;
  bool _hasError = false;

  @override
  void dispose() {
    _resendTimer?.cancel();
    _resendSeconds.dispose();
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _startResendTimer();
    for (var i = 0; i < _otpLength; i++) {
      final index = i;
      _focusNodes[index].onKeyEvent = (_, event) {
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.backspace &&
            _controllers[index].text.isEmpty &&
            index > 0) {
          _focusNodes[index - 1].requestFocus();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      };
    }
  }

  void _startResendTimer() {
    _resendTimer?.cancel();
    _resendSeconds.value = 58;
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_resendSeconds.value > 0) {
        _resendSeconds.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void _onDigitChanged(String value, int index) {
    if (value.length > 1) {
      _controllers[index].text = value[value.length - 1];
      _controllers[index].selection = const TextSelection.collapsed(offset: 1);
    }
    if (value.isNotEmpty && index < _otpLength - 1) {
      _focusNodes[index + 1].requestFocus();
    }
    _currentOtp = _controllers.map((c) => c.text).join();
    setState(() => _hasError = false);
  }

  bool get _isComplete => _currentOtp.length == _otpLength;

  Future<void> _onVerify() async {
    if (!_isComplete) return;
    await ref
        .read(verifyOtpProvider.notifier)
        .verifyOtp(email: widget.email, token: _currentOtp);
  }

  Future<void> _onResend() async {
    if (_resendSeconds.value > 0) return;
    for (final c in _controllers) {
      c.clear();
    }
    _currentOtp = '';
    _focusNodes.first.requestFocus();
    setState(() => _hasError = false);
    _startResendTimer();
    await ref.read(sendOtpProvider.notifier).sendOtp(widget.email);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(verifyOtpProvider, (previous, next) {
      next.whenOrNull(
        error: (error, _) {
          setState(() => _hasError = true);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(error.toString())));
        },
        data: (_) {
          context.go(AppRoutes.home);
        },
      );
    });

    final state = ref.watch(verifyOtpProvider);

    return Scaffold(
      body: Stack(
        children: [
          const AmbientBlob(
            color: AppColors.primaryGlow5,
            alignment: Alignment.topRight,
          ),
          const AmbientBlob(
            color: AppColors.primaryContainerGlow5,
            alignment: Alignment.bottomLeft,
          ),
          SafeArea(
            child: Column(
              children: [
                const GoBackWidget(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: context.responsive.edgeInsetsSymmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    child: Column(
                      children: [
                        16.verticalSpace,
                        InstructionHeader(email: widget.email),
                        48.verticalSpace,
                        OtpInputRow(
                          controllers: _controllers,
                          focusNodes: _focusNodes,
                          hasError: _hasError,
                          onChanged: _onDigitChanged,
                        ),
                        20.verticalSpace,
                        if (_hasError) const OtpErrorMessage(),
                        48.verticalSpace,
                        GradientButton(
                          label: 'Verify Identity',
                          onTap: _onVerify,
                          enabled: _isComplete,
                          isLoading: state.isLoading,
                        ).animate().fadeIn(delay: 400.ms, duration: 600.ms),
                        20.verticalSpace,
                        ValueListenableBuilder<int>(
                          valueListenable: _resendSeconds,
                          builder: (context, seconds, _) => ResendLink(
                            resendSeconds: seconds,
                            onResend: _onResend,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
