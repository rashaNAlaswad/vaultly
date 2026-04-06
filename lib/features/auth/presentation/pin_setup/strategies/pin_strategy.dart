import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The state held by [PinNotifier].
class PinState {
  const PinState({this.digits = const [], this.result});

  final List<int> digits;

  /// Null until the PIN is complete and strategy execution has been attempted.
  final AsyncValue<void>? result;

  int get length => digits.length;

  PinState copyWith({List<int>? digits, AsyncValue<void>? result}) {
    return PinState(
      digits: digits ?? this.digits,
      result: result ?? this.result,
    );
  }
}

/// Encapsulates what happens when the user finishes entering a PIN.
///
/// Implement [PinSetupStrategy] to save a new PIN.
/// Implement [PinEntryStrategy] to verify an existing PIN.
abstract interface class PinStrategy {
  const PinStrategy();

  String get title;
  String get subtitle;
  Future<void> execute(String pin);
}
