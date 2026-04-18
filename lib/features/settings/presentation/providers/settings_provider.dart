import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/providers/shared_preferences_provider.dart';
import '../../data/models/settings_state.dart';
import '../../data/repositories/settings_repository_impl.dart';
import '../../domain/repositories/settings_repository.dart';

part 'settings_provider.g.dart';

@riverpod
SettingsRepository settingsRepository(Ref ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SettingsRepositoryImpl(prefs);
}

@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  @override
  FutureOr<SettingsState> build() async {
    final repo = ref.watch(settingsRepositoryProvider);
    return repo.load();
  }

  Future<void> setBiometricUnlock(bool value) async {
    final repo = ref.read(settingsRepositoryProvider);
    await repo.setBiometricUnlock(value: value);
    state = AsyncData(state.requireValue.copyWith(biometricUnlock: value));
  }

  Future<void> setLockOnBackground(bool value) async {
    final repo = ref.read(settingsRepositoryProvider);
    await repo.setLockOnBackground(value: value);
    state = AsyncData(state.requireValue.copyWith(lockOnBackground: value));
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final repo = ref.read(settingsRepositoryProvider);
    await repo.setThemeMode(value: mode);
    state = AsyncData(state.requireValue.copyWith(themeMode: mode));
  }

  Future<void> setLocale(Locale locale) async {
    final repo = ref.read(settingsRepositoryProvider);
    await repo.setLocale(value: locale);
    state = AsyncData(state.requireValue.copyWith(locale: locale));
  }
}
