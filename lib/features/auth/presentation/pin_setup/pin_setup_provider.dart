import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../features/auth/providers/auth_session_provider.dart';
import 'strategies/pin_strategy.dart';

part 'pin_setup_provider.g.dart';

const int kPinLength = 6;

@riverpod
class PinNotifier extends _$PinNotifier {
  @override
  PinState build(PinStrategy strategy) => const PinState();

  void addDigit(int digit) {
    if (state.result is AsyncLoading) return;

    if (state.digits.length >= kPinLength) return;
    final next = [...state.digits, digit];
    state = state.copyWith(digits: next);
    if (next.length == kPinLength) _execute();
  }

  void removeDigit() {
    if (state.digits.isEmpty) return;
    state = state.copyWith(
      digits: state.digits.sublist(0, state.digits.length - 1),
    );
  }

  void resetDigits() {
    state = const PinState();
  }

  Future<void> _execute() async {
    final pin = state.digits.join();
    state = state.copyWith(result: const AsyncLoading());
    final result = await AsyncValue.guard<void>(() => strategy.execute(pin));
    if (result is AsyncData) {
      // Refresh session so the router has the latest hasPin state.
      ref.invalidate(authSessionProvider);
    }
    state = state.copyWith(result: result);
  }
}
