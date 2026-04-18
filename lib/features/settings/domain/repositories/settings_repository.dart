import 'package:flutter/material.dart';

import '../../data/models/settings_state.dart';

abstract class SettingsRepository {
  SettingsState load();
  Future<void> setBiometricUnlock({required bool value});
  Future<void> setLockOnBackground({required bool value});
  Future<void> setThemeMode({required ThemeMode value});
  Future<void> setLocale({required Locale value});
}
