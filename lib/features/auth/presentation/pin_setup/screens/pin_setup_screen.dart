import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/animations.dart';
import '../../../../../core/routing/app_routes.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../../features/settings/presentation/providers/settings_provider.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../auth/data/repository_providers.dart';
import '../../../../auth/presentation/providers/auth_session_provider.dart';
import '../pin_setup_provider.dart';
import '../strategies/pin_strategy.dart';
import '../widgets/biometric_unlock_hero.dart';
import '../widgets/pin_dot_row.dart';
import '../widgets/pin_hero_section.dart';
import '../widgets/pin_keypad.dart';
import '../widgets/pin_scaffold.dart';

class PinScreen extends ConsumerStatefulWidget {
  const PinScreen({super.key, required this.strategy});

  final PinStrategy strategy;

  @override
  ConsumerState<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends ConsumerState<PinScreen> {
  bool _autoTriggered = false;

  PinStrategy get strategy => widget.strategy;
  late final ProviderSubscription _sub;

  @override
  void dispose() {
    _sub.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _sub = ref.listenManual(pinProvider(strategy).select((s) => s.result), (
      _,
      result,
    ) {
      if (result == null) return;
      switch (result) {
        case AsyncData():
          final pin = ref.read(pinProvider(strategy)).digits.join();
          switch (strategy.action) {
            case PinAction.create:
              context.push(AppRoutes.pinConfirm, extra: pin);
            case PinAction.confirm:
            case PinAction.unlock:
              context.go(AppRoutes.home);
          }
        case AsyncError(:final error):
          ref.read(pinProvider(strategy).notifier).resetDigits();
          AppSnackBar.error(context, error.toString());
        case AsyncLoading():
          break;
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeAutoTrigger());
  }

  Future<void> _maybeAutoTrigger() async {
    if (strategy.action != PinAction.unlock) return;
    final settings = await ref.read(settingsProvider.future);
    if (!settings.biometricUnlock) return;
    if (_autoTriggered) return;
    _autoTriggered = true;
    await _tryBiometric();
  }

  Future<void> _tryBiometric() async {
    final bio = ref.read(biometricRepositoryProvider);
    final l10n = AppLocalizations.of(context);
    try {
      final available = await bio.isAvailable();
      if (!available) return;
      final success = await bio.authenticate(
        localizedReason: l10n.biometricPromptReason,
      );
      if (success && mounted) {
        ref.read(authSessionProvider.notifier).unlock();
        context.go(AppRoutes.home);
      }
    } on PlatformException catch (e) {
      if (mounted) AppSnackBar.error(context, e.message ?? e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final biometricEnabled =
        strategy.action == PinAction.unlock &&
        (ref.watch(settingsProvider).asData?.value.biometricUnlock ?? false);

    return PinScaffold(
      hero: biometricEnabled
          ? BiometricUnlockHero(onTap: _tryBiometric).fadeInSlide(delay: 0)
          : PinHeroSection(
              title: strategy.title(l10n),
              subtitle: strategy.subtitle(l10n),
            ).fadeInSlide(delay: 0),
      dotRow: PinConnectedDotRow(strategy: strategy),
      keypad: PinConnectedKeypad(strategy: strategy),
    );
  }
}
