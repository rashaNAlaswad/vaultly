abstract interface class BiometricRepository {
  Future<bool> isAvailable();
  Future<bool> authenticate({required String localizedReason});
}
