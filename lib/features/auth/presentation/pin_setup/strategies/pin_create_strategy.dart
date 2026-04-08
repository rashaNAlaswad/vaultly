import '../../../../../features/auth/validators/pin_validator.dart';
import 'pin_strategy.dart';

/// Validates the first PIN entry before proceeding to confirmation.
class PinCreateStrategy implements PinStrategy {
  const PinCreateStrategy();

  @override
  String get title => 'Create your PIN';

  @override
  String get subtitle => 'Your PIN encrypts your vault. We never store it.';

  @override
  PinAction get action => PinAction.create;

  @override
  Future<void> execute(String pin) async => PinValidator.validate(pin);
}
