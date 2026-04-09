// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PasswordEntry _$PasswordEntryFromJson(Map<String, dynamic> json) =>
    _PasswordEntry(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      siteName: json['site_name'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      notes: json['notes'] as String? ?? '',
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$PasswordEntryToJson(_PasswordEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'site_name': instance.siteName,
      'username': instance.username,
      'password': instance.password,
      'tags': instance.tags,
      'notes': instance.notes,
      'created_at': instance.createdAt.toIso8601String(),
    };
