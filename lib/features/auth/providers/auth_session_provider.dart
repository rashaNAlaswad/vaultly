import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/constants/secure_storage_keys.dart';
import '../../../core/helpers/shared_pref_helper.dart';

part 'auth_session_provider.g.dart';

typedef AuthSessionData = ({String? userId, bool hasPin, bool isUnlocked});

@Riverpod(keepAlive: true)
class AuthSession extends _$AuthSession {
  @override
  Future<AuthSessionData> build() async {
    final userId = await SharedPrefHelper.getSecuredString(SecureStorageKeys.userId);
    final pin = await SharedPrefHelper.getSecuredString(SecureStorageKeys.pin);
    return (
      userId: userId.isEmpty ? null : userId,
      hasPin: pin.isNotEmpty,
      isUnlocked: false, // always false on cold start
    );
  }

  Future<void> saveUserId(String userId) async {
    await SharedPrefHelper.setSecuredString(SecureStorageKeys.userId, userId);
    state = AsyncData((
      userId: userId,
      hasPin: state.asData?.value.hasPin ?? false,
      isUnlocked: true, // OTP verified — session is active
    ));
  }

  Future<void> savePin(String pin) async {
    await SharedPrefHelper.setSecuredString(SecureStorageKeys.pin, pin);
    markPinSaved();
  }

  void markPinSaved() {
    state = AsyncData((
      userId: state.asData?.value.userId,
      hasPin: true,
      isUnlocked: state.asData?.value.isUnlocked ?? true,
    ));
  }

  void unlock() {
    state = AsyncData((
      userId: state.asData?.value.userId,
      hasPin: state.asData?.value.hasPin ?? false,
      isUnlocked: true,
    ));
  }

  Future<void> clearSession() async {
    await SharedPrefHelper.clearAllSecuredData();
    state = const AsyncData((userId: null, hasPin: false, isUnlocked: false));
  }
}
