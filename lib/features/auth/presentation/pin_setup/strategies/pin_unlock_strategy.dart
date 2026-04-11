import '../../../../../core/constants/secure_storage_keys.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../l10n/app_localizations.dart';
import 'pin_strategy.dart';

/// Verifies the entered PIN against the one stored in secure storage.
class PinUnlockStrategy implements PinStrategy {
  const PinUnlockStrategy();

  @override
  String title(AppLocalizations l10n) => l10n.unlockPinTitle;

  @override
  String subtitle(AppLocalizations l10n) => l10n.unlockPinSubtitle;

  @override
  PinAction get action => PinAction.unlock;

  @override
  Future<void> execute(String pin) async {
    final stored = await SharedPrefHelper.getSecuredString(SecureStorageKeys.pin);
    if (pin != stored) throw Exception('Incorrect PIN. Try again.');
  }
}
