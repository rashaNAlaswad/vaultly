import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/utils.dart';
import '../../../auth/presentation/providers/auth_session_provider.dart';
import '../../data/models/password_entry.dart';
import '../../data/repository_providers.dart';

part 'passwords_provider.g.dart';

@Riverpod(keepAlive: true)
class PasswordsNotifier extends _$PasswordsNotifier {
  @override
  Future<List<PasswordEntry>> build() async {
    return ref.watch(passwordRepositoryProvider).fetchAll();
  }

  Future<void> addPassword({
    required String siteName,
    required String username,
    required String password,
    required List<String> tags,
    String notes = '',
  }) async {
    final userId = ref.read(authSessionProvider).asData?.value.userId;
    if (userId == null) throw Exception('No active session');

    final entry = PasswordEntry(
      id: Utils.generateUuid(),
      userId: userId,
      siteName: siteName,
      username: username,
      password: password,
      tags: tags,
      notes: notes,
      createdAt: DateTime.now(),
    );

    await ref.read(passwordRepositoryProvider).save(entry);
    state = AsyncData([entry, ...?state.value]);
  }

  Future<void> updatePassword(PasswordEntry updated) async {
    await ref.read(passwordRepositoryProvider).update(updated);
    state = AsyncData(
      state.value?.map((e) => e.id == updated.id ? updated : e).toList() ?? [],
    );
  }

  Future<void> deletePassword(String id) async {
    final repository = ref.read(passwordRepositoryProvider);

    await repository.delete(id);
    state = AsyncData(
      state.value?.where((e) => e.id != id).toList() ?? [],
    );
  }

  Future<void> deleteAllPasswords() async {
    await ref.read(passwordRepositoryProvider).deleteAll();
    state = const AsyncData([]);
  }
}
