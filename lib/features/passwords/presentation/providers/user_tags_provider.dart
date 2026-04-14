import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/vault_categories.dart';
import '../../data/repository_providers.dart';

part 'user_tags_provider.g.dart';

@Riverpod(keepAlive: true)
class UserTagsNotifier extends _$UserTagsNotifier {
  @override
  Future<List<String>> build() async {
    final repo = ref.watch(userTagsRepositoryProvider);
    final tags = await repo.fetchTags();
    final missing = kVaultCategories.where((t) => !tags.contains(t)).toList();
    if (missing.isEmpty) return tags;
    // Defaults always appear first, custom tags after
    final merged = [
      ...kVaultCategories,
      ...tags.where((t) => !kVaultCategories.contains(t)),
    ];
    await repo.saveTags(merged);
    return merged;
  }

  Future<bool> addTag(String tag) async {
    final current = state.asData?.value ?? [];
    if (current.any((t) => t.toLowerCase() == tag.toLowerCase())) return false;
    final updated = [...current, tag];
    await ref.read(userTagsRepositoryProvider).saveTags(updated);
    state = AsyncData(updated);
    return true;
  }
}
