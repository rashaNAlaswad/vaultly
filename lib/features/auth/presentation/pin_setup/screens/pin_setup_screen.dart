import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/animations.dart';
import '../../../../../core/routing/app_routes.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../../l10n/app_localizations.dart';
import '../pin_setup_provider.dart';
import '../strategies/pin_strategy.dart';
import '../widgets/pin_dot_row.dart';
import '../widgets/pin_hero_section.dart';
import '../widgets/pin_keypad.dart';
import '../widgets/pin_scaffold.dart';

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
          data: (_) {
            final pin = ref.read(pinProvider(strategy)).digits.join();
            switch (strategy.action) {
              case PinAction.create:
                context.push(AppRoutes.pinConfirm, extra: pin);
              case PinAction.confirm || PinAction.unlock:
                context.go(AppRoutes.home);
            }
          },
          error: (error, _) {
            ref.read(pinProvider(strategy).notifier).resetDigits();
            AppSnackBar.error(context, error.toString());
          },
        );
      },
    );

    final l10n = AppLocalizations.of(context);
    return PinScaffold(
      hero: PinHeroSection(
        title: strategy.title(l10n),
        subtitle: strategy.subtitle(l10n),
      ).fadeInSlide(delay: 0),
      dotRow: PinConnectedDotRow(strategy: strategy),
      keypad: PinConnectedKeypad(strategy: strategy),
    );
  }
}
