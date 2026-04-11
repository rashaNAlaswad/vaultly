import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/repositories/user_tags_repository.dart';

class SupabaseUserTagsRepository implements UserTagsRepository {
  const SupabaseUserTagsRepository(this._client);

  final SupabaseClient _client;

  @override
  Future<List<String>> fetchTags() async {
    final userId = _client.auth.currentUser?.id;
    if (userId == null) return [];
    final row = await _client
        .from('user_tags')
        .select('tags')
        .eq('user_id', userId)
        .maybeSingle();
    final raw = row?['tags'] as List<dynamic>? ?? [];
    return raw.cast<String>();
  }

  @override
  Future<void> saveTags(List<String> tags) async {
    final userId = _client.auth.currentUser?.id;
    if (userId == null) return;
    await _client.from('user_tags').upsert({
      'user_id': userId,
      'tags': tags,
    });
  }
}
