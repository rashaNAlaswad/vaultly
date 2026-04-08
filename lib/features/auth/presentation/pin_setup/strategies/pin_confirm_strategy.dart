import '../../../../../core/constants/secure_storage_keys.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
import 'pin_strategy.dart';

/// Validates the confirmed PIN matches the first entry, then saves it.
class PinConfirmStrategy implements PinStrategy {
  const PinConfirmStrategy(this.firstPin);

  final String firstPin;

  @override
  String get title => 'Confirm your PIN';

  @override
  String get subtitle => 'Enter your PIN again to confirm.';

  @override
  PinAction get action => PinAction.confirm;

  @override
  Future<void> execute(String pin) async {
    if (pin != firstPin) throw Exception('PINs do not match. Try again.');
    await SharedPrefHelper.setSecuredString(SecureStorageKeys.pin, pin);
  }
}
