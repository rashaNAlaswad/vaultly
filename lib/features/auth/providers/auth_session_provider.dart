import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/constants/secure_storage_keys.dart';
import '../../../core/helpers/shared_pref_helper.dart';
import '../data/models/auth_session_data.dart';

part 'auth_session_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthSession extends _$AuthSession {
  @override
  Future<AuthSessionData> build() async {
    final userId =
        await SharedPrefHelper.getSecuredString(SecureStorageKeys.userId);
    final pin =
        await SharedPrefHelper.getSecuredString(SecureStorageKeys.pin);
    return AuthSessionData(
      userId: userId.isEmpty ? null : userId,
      hasPin: pin.isNotEmpty,
    );
  }

  Future<void> saveUserId(String userId) async {
    await SharedPrefHelper.setSecuredString(SecureStorageKeys.userId, userId);
    state = AsyncData(
      (state.asData?.value ?? const AuthSessionData()).copyWith(
        userId: userId,
        isUnlocked: true,
      ),
    );
  }

  Future<void> savePin(String pin) async {
    await SharedPrefHelper.setSecuredString(SecureStorageKeys.pin, pin);
    markPinSaved();
  }

  void markPinSaved() {
    state = AsyncData(
      (state.asData?.value ?? const AuthSessionData()).copyWith(hasPin: true),
    );
  }

  void unlock() {
    state = AsyncData(
      (state.asData?.value ?? const AuthSessionData()).copyWith(
        isUnlocked: true,
      ),
    );
  }

  void lock() {
    final current = state.asData?.value;
    if (current == null || !current.hasPin || !current.isUnlocked) return;
    state = AsyncData(current.copyWith(isUnlocked: false));
  }

  Future<void> clearSession() async {
    await SharedPrefHelper.clearAllSecuredData();
    state = const AsyncData(AuthSessionData());
  }
}
