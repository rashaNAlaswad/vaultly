import 'package:local_auth/local_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/providers/supabase_provider.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/biometric_repository.dart';
import 'repositories/biometric_repository_impl.dart';
import 'repositories/supabase_auth_repository.dart';

part 'repository_providers.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) =>
    SupabaseAuthRepository(ref.watch(supabaseClientProvider));

@riverpod
BiometricRepository biometricRepository(Ref ref) =>
    BiometricRepositoryImpl(LocalAuthentication());
