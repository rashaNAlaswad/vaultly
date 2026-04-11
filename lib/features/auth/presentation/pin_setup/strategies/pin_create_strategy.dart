import '../../../../../features/auth/validators/pin_validator.dart';
import '../../../../../l10n/app_localizations.dart';
import 'pin_strategy.dart';

/// Validates the first PIN entry before proceeding to confirmation.
class PinCreateStrategy implements PinStrategy {
  const PinCreateStrategy();

  @override
  String title(AppLocalizations l10n) => l10n.createPinTitle;

  @override
  String subtitle(AppLocalizations l10n) => l10n.createPinSubtitle;

  @override
  PinAction get action => PinAction.create;

  @override
  Future<void> execute(String pin) async => PinValidator.validate(pin);
}
