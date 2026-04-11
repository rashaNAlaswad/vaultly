import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/repositories/supabase_user_tags_repository.dart';
import '../../domain/repositories/user_tags_repository.dart';

part 'user_tags_provider.g.dart';

@riverpod
UserTagsRepository userTagsRepository(Ref ref) =>
    SupabaseUserTagsRepository(Supabase.instance.client);

@riverpod
class UserTagsNotifier extends _$UserTagsNotifier {
  @override
  Future<List<String>> build() async {
    final repo = ref.read(userTagsRepositoryProvider);
    return await repo.fetchTags();
  }

  Future<void> addTag(String tag) async {
    final current = state.asData?.value ?? [];
    final updated = [...current, tag];
    await ref.read(userTagsRepositoryProvider).saveTags(updated);
    state = AsyncData(updated);
  }
}
