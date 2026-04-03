import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/repositories/auth_repository.dart';

class SupabaseAuthRepository implements AuthRepository {
  const SupabaseAuthRepository(this._client);

  final SupabaseClient _client;

  @override
  Future<void> sendOtp(String email) async {
    await _client.auth.signInWithOtp(email: email);
  }

  @override
  Future<void> verifyOtp({
    required String email,
    required String token,
  }) async {
    await _client.auth.verifyOTP(
      email: email,
      token: token,
      type: OtpType.email,
    );
  }
}
