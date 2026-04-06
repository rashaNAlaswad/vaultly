abstract interface class AuthRepository {
  Future<void> sendOtp(String email);

  Future<String> verifyOtp({required String email, required String token});
}
