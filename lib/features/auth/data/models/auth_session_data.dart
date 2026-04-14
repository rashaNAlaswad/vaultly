import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_session_data.freezed.dart';

@freezed
abstract class AuthSessionData with _$AuthSessionData {
  const factory AuthSessionData({
    String? userId,
    @Default(false) bool hasPin,
    @Default(false) bool isUnlocked,
  }) = _AuthSessionData;
}
