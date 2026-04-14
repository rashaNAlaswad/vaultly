class PinValidator {
  const PinValidator._();

  static void validate(String pin) {
    if (_isAllSameDigits(pin)) {
      throw Exception('PIN is too weak. Avoid repeated digits.');
    }
    if (_isSequential(pin)) {
      throw Exception('PIN is too weak. Avoid sequential digits.');
    }
  }

  static bool _isAllSameDigits(String pin) => pin.split('').toSet().length == 1;

  static bool _isSequential(String pin) {
    final digits = pin.split('').map(int.parse).toList();
    bool ascending = true;
    bool descending = true;
    for (int i = 1; i < digits.length; i++) {
      if (digits[i] != digits[i - 1] + 1) ascending = false;
      if (digits[i] != digits[i - 1] - 1) descending = false;
    }
    return ascending || descending;
  }
}
