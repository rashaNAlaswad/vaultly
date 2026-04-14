import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/shared_pref_keys.dart';

part 'locale_provider.g.dart';

@Riverpod(keepAlive: true)
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Future<Locale> build() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(SharedPrefKeys.locale) ?? 'en';
    return Locale(code);
  }

  Future<void> setLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPrefKeys.locale, locale.languageCode);
    state = AsyncData(locale);
  }

  Future<void> toggleLocale() async {
    final current = state.value?.languageCode ?? 'en';
    await setLocale(Locale(current == 'en' ? 'ar' : 'en'));
  }
}
