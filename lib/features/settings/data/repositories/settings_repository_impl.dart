import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../domain/repositories/settings_repository.dart';
import '../models/settings_state.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  const SettingsRepositoryImpl(this._prefs);

  final SharedPreferences _prefs;

  static ThemeMode _parseThemeMode(String? value) => switch (value) {
    'light' => ThemeMode.light,
    'dark' => ThemeMode.dark,
    _ => ThemeMode.system,
  };

  static String _themeModeToString(ThemeMode mode) => switch (mode) {
    ThemeMode.light => 'light',
    ThemeMode.dark => 'dark',
    ThemeMode.system => 'system',
  };

  @override
  SettingsState load() {
    return SettingsState(
      biometricUnlock: _prefs.getBool(SharedPrefKeys.biometricUnlock) ?? false,
      lockOnBackground: _prefs.getBool(SharedPrefKeys.lockOnBackground) ?? true,
      themeMode: _parseThemeMode(_prefs.getString(SharedPrefKeys.themeMode)),
      locale: Locale(_prefs.getString(SharedPrefKeys.locale) ?? 'en'),
    );
  }

  @override
  Future<void> setBiometricUnlock({required bool value}) async {
    await _prefs.setBool(SharedPrefKeys.biometricUnlock, value);
  }

  @override
  Future<void> setLockOnBackground({required bool value}) async {
    await _prefs.setBool(SharedPrefKeys.lockOnBackground, value);
  }

  @override
  Future<void> setThemeMode({required ThemeMode value}) async {
    await _prefs.setString(SharedPrefKeys.themeMode, _themeModeToString(value));
  }

  @override
  Future<void> setLocale({required Locale value}) async {
    await _prefs.setString(SharedPrefKeys.locale, value.languageCode);
  }
}
