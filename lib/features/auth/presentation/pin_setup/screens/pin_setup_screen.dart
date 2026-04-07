import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/animations.dart';
import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/routing/app_routes.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../widgets/ambient_blob.dart';
import '../pin_setup_provider.dart';
import '../strategies/pin_strategy.dart';
import '../widgets/pin_dot_row.dart';
import '../widgets/pin_hero_section.dart';
import '../widgets/pin_keypad.dart';

class PinScreen extends ConsumerWidget {
  const PinScreen({super.key, required this.strategy});

  final PinStrategy strategy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      pinProvider(strategy).select((s) => s.result),
      (_, result) {
        if (result == null) return;
        result.whenOrNull(
          data: (_) => context.go(AppRoutes.home),
          error: (error, _) {
            ref.read(pinProvider(strategy).notifier).resetDigits();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error.toString())),
            );
          },
        );
      },
    );

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
                  _HeroSection(strategy: strategy),
                  40.verticalSpace,
                  _DotRow(strategy: strategy),
                  48.verticalSpace,
                  _Keypad(strategy: strategy),
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

class _HeroSection extends StatelessWidget {
  const _HeroSection({required this.strategy});

  final PinStrategy strategy;

  @override
  Widget build(BuildContext context) {
    return PinHeroSection(
      title: strategy.title,
      subtitle: strategy.subtitle,
    ).fadeInSlide(delay: 0);
  }
}

class _DotRow extends ConsumerWidget {
  const _DotRow({required this.strategy});

  final PinStrategy strategy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final length = ref.watch(pinProvider(strategy)).length;
    return PinDotRow(filledCount: length).fadeInSlide(delay: 100);
  }
}

class _Keypad extends ConsumerWidget {
  const _Keypad({required this.strategy});

  final PinStrategy strategy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(pinProvider(strategy).notifier);
    return PinKeypad(
      onDigit: notifier.addDigit,
      onBackspace: notifier.removeDigit,
    ).fadeInSlide(delay: 200);
  }
}
