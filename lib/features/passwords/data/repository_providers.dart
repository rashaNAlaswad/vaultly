import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/providers/supabase_provider.dart';
import '../domain/repositories/password_repository.dart';
import '../domain/repositories/user_tags_repository.dart';
import 'repositories/supabase_password_repository.dart';
import 'repositories/supabase_user_tags_repository.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
PasswordRepository passwordRepository(Ref ref) =>
    SupabasePasswordRepository(ref.watch(supabaseClientProvider));

@Riverpod(keepAlive: true)
UserTagsRepository userTagsRepository(Ref ref) =>
    SupabaseUserTagsRepository(ref.watch(supabaseClientProvider));
