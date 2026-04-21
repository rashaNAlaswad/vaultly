import 'package:local_auth/local_auth.dart';

import '../../domain/repositories/biometric_repository.dart';

class BiometricRepositoryImpl implements BiometricRepository {
  const BiometricRepositoryImpl(this._auth);

  final LocalAuthentication _auth;

  @override
  Future<bool> isAvailable() async {
    final isSupported = await _auth.isDeviceSupported();
    if (!isSupported) return false;
    final available = await _auth.getAvailableBiometrics();
    return available.contains(BiometricType.fingerprint);
  }

  @override
  Future<bool> authenticate({required String localizedReason}) =>
      _auth.authenticate(
        localizedReason: localizedReason,
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
}
