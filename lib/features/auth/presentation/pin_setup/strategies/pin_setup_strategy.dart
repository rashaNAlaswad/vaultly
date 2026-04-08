import '../../../../../core/constants/secure_storage_keys.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
import 'pin_strategy.dart';

/// Saves a new PIN to secure storage.
class PinSetupStrategy implements PinStrategy {
  const PinSetupStrategy();

  @override
  String get title => 'Create your PIN';

  @override
  String get subtitle => 'Your PIN encrypts your vault. We never store it.';

  @override
  PinAction get action => PinAction.setup;

  @override
  Future<void> execute(String pin) async {
    await SharedPrefHelper.setSecuredString(SecureStorageKeys.pin, pin);
  }
}
