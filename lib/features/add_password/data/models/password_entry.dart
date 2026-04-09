import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_entry.freezed.dart';
part 'password_entry.g.dart';

@freezed
abstract class PasswordEntry with _$PasswordEntry {
  const factory PasswordEntry({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'site_name') required String siteName,
    required String username,
    required String password,
    @Default([]) List<String> tags,
    @Default('') String notes,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _PasswordEntry;

  factory PasswordEntry.fromJson(Map<String, dynamic> json) =>
      _$PasswordEntryFromJson(json);
}
