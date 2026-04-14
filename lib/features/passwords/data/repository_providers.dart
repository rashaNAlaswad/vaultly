import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../domain/repositories/password_repository.dart';
import '../domain/repositories/user_tags_repository.dart';
import 'repositories/supabase_password_repository.dart';
import 'repositories/supabase_user_tags_repository.dart';

part 'repository_providers.g.dart';

@riverpod
PasswordRepository passwordRepository(Ref ref) {
  return SupabasePasswordRepository(Supabase.instance.client);
}

@riverpod
UserTagsRepository userTagsRepository(Ref ref) =>
    SupabaseUserTagsRepository(Supabase.instance.client);
