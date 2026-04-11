import '../../../../../core/constants/secure_storage_keys.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../l10n/app_localizations.dart';
import 'pin_strategy.dart';

/// Validates the confirmed PIN matches the first entry, then saves it.
class PinConfirmStrategy implements PinStrategy {
  const PinConfirmStrategy(this.firstPin);

  final String firstPin;

  @override
  String title(AppLocalizations l10n) => l10n.confirmPinTitle;

  @override
  String subtitle(AppLocalizations l10n) => l10n.confirmPinSubtitle;

  @override
  PinAction get action => PinAction.confirm;

  @override
  Future<void> execute(String pin) async {
    if (pin != firstPin) throw Exception('PINs do not match. Try again.');
    await SharedPrefHelper.setSecuredString(SecureStorageKeys.pin, pin);
  }
}
