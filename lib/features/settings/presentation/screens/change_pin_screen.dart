import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/animations.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/pin_setup/pin_setup_provider.dart';
import '../../../auth/presentation/pin_setup/strategies/pin_confirm_strategy.dart';
import '../../../auth/presentation/pin_setup/strategies/pin_create_strategy.dart';
import '../../../auth/presentation/pin_setup/strategies/pin_strategy.dart';
import '../../../auth/presentation/pin_setup/strategies/pin_unlock_strategy.dart';
import '../../../auth/presentation/pin_setup/widgets/pin_dot_row.dart';
import '../../../auth/presentation/pin_setup/widgets/pin_hero_section.dart';
import '../../../auth/presentation/pin_setup/widgets/pin_keypad.dart';
import '../../../auth/presentation/pin_setup/widgets/pin_scaffold.dart';

enum _Step { verify, enterNew, confirm }

class ChangePinScreen extends ConsumerStatefulWidget {
  const ChangePinScreen({super.key});

  @override
  ConsumerState<ChangePinScreen> createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends ConsumerState<ChangePinScreen> {
  _Step _step = _Step.verify;
  PinStrategy _strategy = const PinUnlockStrategy();
  String? _newPin;

  String _title(AppLocalizations l10n) => switch (_step) {
        _Step.verify => l10n.changePinVerifyTitle,
        _Step.enterNew => l10n.changePinNewTitle,
        _Step.confirm => l10n.changePinConfirmTitle,
      };

  String _subtitle(AppLocalizations l10n) => switch (_step) {
        _Step.verify => l10n.changePinVerifySubtitle,
        _Step.enterNew => l10n.changePinNewSubtitle,
        _Step.confirm => l10n.changePinConfirmSubtitle,
      };

  void _advanceTo(_Step next, PinStrategy nextStrategy) {
    setState(() {
      _step = next;
      _strategy = nextStrategy;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      pinProvider(_strategy).select((s) => s.result),
      (_, result) {
        if (result == null) return;
        result.whenOrNull(
          data: (_) {
            switch (_step) {
              case _Step.verify:
                _advanceTo(_Step.enterNew, const PinCreateStrategy());
              case _Step.enterNew:
                _newPin = ref.read(pinProvider(_strategy)).digits.join();
                _advanceTo(_Step.confirm, PinConfirmStrategy(_newPin!));
              case _Step.confirm:
                final l10n = AppLocalizations.of(context);
                AppSnackBar.success(context, l10n.pinChanged);
                context.go(AppRoutes.settings);
            }
          },
          error: (error, _) {
            ref.read(pinProvider(_strategy).notifier).resetDigits();
            AppSnackBar.error(context, error.toString());
          },
        );
      },
    );

    final l10n = AppLocalizations.of(context);
    return PinScaffold(
      hero: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: PinHeroSection(
          key: ValueKey(_step),
          title: _title(l10n),
          subtitle: _subtitle(l10n),
        ),
      ).fadeInSlide(delay: 0),
      dotRow: PinConnectedDotRow(strategy: _strategy),
      keypad: PinConnectedKeypad(strategy: _strategy),
    );
  }
}
