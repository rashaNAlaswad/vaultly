import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository_providers.dart';
import 'auth_session_provider.dart';

part 'auth_providers.g.dart';

@riverpod
class SendOtpNotifier extends _$SendOtpNotifier {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> sendOtp(String email) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).sendOtp(email),
    );
  }
}

@riverpod
class VerifyOtpNotifier extends _$VerifyOtpNotifier {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> verifyOtp({
    required String email,
    required String token,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final userId = await ref.read(authRepositoryProvider).verifyOtp(
            email: email,
            token: token,
          );
      await ref.read(authSessionProvider.notifier).saveUserId(userId);
    });
  }
}
