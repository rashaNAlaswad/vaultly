import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/utils/utils.dart';
import '../../data/models/password_entry.dart';
import '../../data/repositories/supabase_password_repository.dart';
import '../../domain/repositories/password_repository.dart';

part 'passwords_provider.g.dart';

@riverpod
PasswordRepository passwordRepository(Ref ref) {
  return SupabasePasswordRepository(Supabase.instance.client);
}

@riverpod
class PasswordsNotifier extends _$PasswordsNotifier {
  @override
  Future<List<PasswordEntry>> build() async {
    return ref.read(passwordRepositoryProvider).fetchAll();
  }

  Future<void> addPassword(PasswordEntry entry) async {
    final withId = entry.copyWith(id: Utils.generateUuid());
    await ref.read(passwordRepositoryProvider).save(withId);
    state = AsyncData([withId, ...?state.value]);
  }

  Future<void> deletePassword(String id) async {
    final repository = ref.read(passwordRepositoryProvider);

    await repository.delete(id);
    state = AsyncData(
      state.value?.where((e) => e.id != id).toList() ?? [],
    );
  }
}
