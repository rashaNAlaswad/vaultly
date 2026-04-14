import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../domain/repositories/auth_repository.dart';
import 'repositories/supabase_auth_repository.dart';

part 'repository_providers.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return SupabaseAuthRepository(Supabase.instance.client);
}
