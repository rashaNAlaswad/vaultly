import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/repositories/password_repository.dart';
import '../models/password_entry.dart';

class SupabasePasswordRepository implements PasswordRepository {
  const SupabasePasswordRepository(this._client);

  final SupabaseClient _client;

  @override
  Future<List<PasswordEntry>> fetchAll() async {
    final userId = _client.auth.currentUser?.id;
    if (userId == null) return [];
    final data = await _client
        .from('passwords')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false);
    return data
        .map((row) => PasswordEntry.fromJson(row))
        .toList();
  }

  @override
  Future<void> save(PasswordEntry entry) async {
    await _client.from('passwords').insert(entry.toJson());
  }

  @override
  Future<void> update(PasswordEntry entry) async {
    await _client.from('passwords').update({
      'site_name': entry.siteName,
      'username': entry.username,
      'password': entry.password,
      'tags': entry.tags,
      'notes': entry.notes,
    }).eq('id', entry.id);
  }

  @override
  Future<void> delete(String id) async {
    await _client.from('passwords').delete().eq('id', id);
  }

  @override
  Future<void> deleteAll() async {
    final userId = _client.auth.currentUser?.id;
    if (userId == null) return;
    await _client.from('passwords').delete().eq('user_id', userId);
  }
}
