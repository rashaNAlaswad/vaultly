import '../../data/models/password_entry.dart';

abstract class PasswordRepository {
  Future<List<PasswordEntry>> fetchAll();
  Future<void> save(PasswordEntry entry);
  Future<void> update(PasswordEntry entry);
  Future<void> delete(String id);
}
