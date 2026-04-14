import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/shared_pref_keys.dart';

part 'settings_provider.g.dart';

class SettingsState {
  const SettingsState({
    this.biometricUnlock = false,
    this.lockOnBackground = true,
  });

  final bool biometricUnlock;
  final bool lockOnBackground;

  SettingsState copyWith({bool? biometricUnlock, bool? lockOnBackground}) =>
      SettingsState(
        biometricUnlock: biometricUnlock ?? this.biometricUnlock,
        lockOnBackground: lockOnBackground ?? this.lockOnBackground,
      );
}

@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  late SharedPreferences _prefs;

  @override
  Future<SettingsState> build() async {
    _prefs = await SharedPreferences.getInstance();
    return SettingsState(
      biometricUnlock: _prefs.getBool(SharedPrefKeys.biometricUnlock) ?? false,
      lockOnBackground:
          _prefs.getBool(SharedPrefKeys.lockOnBackground) ?? true,
    );
  }

  Future<void> setBiometricUnlock(bool value) async {
    await _prefs.setBool(SharedPrefKeys.biometricUnlock, value);
    state = AsyncData(state.requireValue.copyWith(biometricUnlock: value));
  }

  Future<void> setLockOnBackground(bool value) async {
    await _prefs.setBool(SharedPrefKeys.lockOnBackground, value);
    state = AsyncData(state.requireValue.copyWith(lockOnBackground: value));
  }
}
