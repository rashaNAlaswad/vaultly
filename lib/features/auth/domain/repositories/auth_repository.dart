abstract interface class AuthRepository {
  Future<void> sendOtp(String email);

  Future<void> verifyOtp({required String email, required String token});
}
