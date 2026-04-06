import '../../../../../core/constants/secure_storage_keys.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
import 'pin_strategy.dart';

/// Verifies the entered PIN against the one stored in secure storage.
class PinEntryStrategy implements PinStrategy {
  const PinEntryStrategy();

  @override
  String get title => 'Enter your PIN';

  @override
  String get subtitle => 'Unlock your vault to continue.';

  @override
  Future<void> execute(String pin) async {
    final stored = await SharedPrefHelper.getSecuredString(SecureStorageKeys.pin);
    if (pin != stored) throw Exception('Incorrect PIN. Try again.');
  }
}
