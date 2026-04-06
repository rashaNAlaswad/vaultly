import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pin_setup_provider.g.dart';

const int kPinLength = 6;

@riverpod
class PinSetup extends _$PinSetup {
  @override
  List<int> build() => const [];

  void addDigit(int digit) {
    if (state.length >= kPinLength) return;
    state = [...state, digit];
    if (state.length == kPinLength) _onPinComplete();
  }

  void removeDigit() {
    if (state.isEmpty) return;
    state = state.sublist(0, state.length - 1);
  }

  void _onPinComplete() {}
}
