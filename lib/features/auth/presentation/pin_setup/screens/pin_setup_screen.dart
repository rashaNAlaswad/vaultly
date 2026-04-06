import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/extensions/animations.dart';
import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../widgets/ambient_blob.dart';
import '../pin_setup_provider.dart';
import '../widgets/pin_dot_row.dart';
import '../widgets/pin_hero_section.dart';
import '../widgets/pin_keypad.dart';

class PinSetupScreen extends StatelessWidget {
  const PinSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AmbientBlob(
            color: AppColors.primaryGlow8,
            alignment: Alignment.topRight,
          ),
          const AmbientBlob(
            color: AppColors.secondaryGlow5,
            alignment: Alignment.bottomLeft,
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: context.responsive.edgeInsetsSymmetric(horizontal: 24),
              child: Column(
                children: [
                  48.verticalSpace,
                  const _AnimatedHeroSection(),
                  40.verticalSpace,
                  const _AnimatedDotRow(),
                  48.verticalSpace,
                  const _AnimatedKeypad(),
                  200.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Rendered once — animation runs on first build only.
class _AnimatedHeroSection extends StatelessWidget {
  const _AnimatedHeroSection();

  @override
  Widget build(BuildContext context) {
    return const PinHeroSection().fadeInSlide(delay: 0);
  }
}

/// Only rebuilds when filledCount changes via the provider.
class _AnimatedDotRow extends ConsumerWidget {
  const _AnimatedDotRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filledCount = ref.watch(pinSetupProvider).length;
    return PinDotRow(filledCount: filledCount).fadeInSlide(delay: 100);
  }
}

/// Rendered once — stable method references, never needs to rebuild.
class _AnimatedKeypad extends ConsumerWidget {
  const _AnimatedKeypad();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(pinSetupProvider.notifier);
    return PinKeypad(
      onDigit: notifier.addDigit,
      onBackspace: notifier.removeDigit,
    ).fadeInSlide(delay: 200);
  }
}
