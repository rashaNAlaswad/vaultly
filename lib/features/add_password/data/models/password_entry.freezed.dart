// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PasswordEntry {

 String get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'site_name') String get siteName; String get username; String get password; List<String> get tags; String get notes;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of PasswordEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordEntryCopyWith<PasswordEntry> get copyWith => _$PasswordEntryCopyWithImpl<PasswordEntry>(this as PasswordEntry, _$identity);

  /// Serializes this PasswordEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.siteName, siteName) || other.siteName == siteName)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,siteName,username,password,const DeepCollectionEquality().hash(tags),notes,createdAt);

@override
String toString() {
  return 'PasswordEntry(id: $id, userId: $userId, siteName: $siteName, username: $username, password: $password, tags: $tags, notes: $notes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PasswordEntryCopyWith<$Res>  {
  factory $PasswordEntryCopyWith(PasswordEntry value, $Res Function(PasswordEntry) _then) = _$PasswordEntryCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'site_name') String siteName, String username, String password, List<String> tags, String notes,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$PasswordEntryCopyWithImpl<$Res>
    implements $PasswordEntryCopyWith<$Res> {
  _$PasswordEntryCopyWithImpl(this._self, this._then);

  final PasswordEntry _self;
  final $Res Function(PasswordEntry) _then;

/// Create a copy of PasswordEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? siteName = null,Object? username = null,Object? password = null,Object? tags = null,Object? notes = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,siteName: null == siteName ? _self.siteName : siteName // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PasswordEntry].
extension PasswordEntryPatterns on PasswordEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PasswordEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PasswordEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PasswordEntry value)  $default,){
final _that = this;
switch (_that) {
case _PasswordEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PasswordEntry value)?  $default,){
final _that = this;
switch (_that) {
case _PasswordEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'site_name')  String siteName,  String username,  String password,  List<String> tags,  String notes, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PasswordEntry() when $default != null:
return $default(_that.id,_that.userId,_that.siteName,_that.username,_that.password,_that.tags,_that.notes,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'site_name')  String siteName,  String username,  String password,  List<String> tags,  String notes, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _PasswordEntry():
return $default(_that.id,_that.userId,_that.siteName,_that.username,_that.password,_that.tags,_that.notes,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'site_name')  String siteName,  String username,  String password,  List<String> tags,  String notes, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PasswordEntry() when $default != null:
return $default(_that.id,_that.userId,_that.siteName,_that.username,_that.password,_that.tags,_that.notes,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PasswordEntry implements PasswordEntry {
  const _PasswordEntry({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'site_name') required this.siteName, required this.username, required this.password, final  List<String> tags = const [], this.notes = '', @JsonKey(name: 'created_at') required this.createdAt}): _tags = tags;
  factory _PasswordEntry.fromJson(Map<String, dynamic> json) => _$PasswordEntryFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'site_name') final  String siteName;
@override final  String username;
@override final  String password;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey() final  String notes;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of PasswordEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordEntryCopyWith<_PasswordEntry> get copyWith => __$PasswordEntryCopyWithImpl<_PasswordEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PasswordEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.siteName, siteName) || other.siteName == siteName)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,siteName,username,password,const DeepCollectionEquality().hash(_tags),notes,createdAt);

@override
String toString() {
  return 'PasswordEntry(id: $id, userId: $userId, siteName: $siteName, username: $username, password: $password, tags: $tags, notes: $notes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PasswordEntryCopyWith<$Res> implements $PasswordEntryCopyWith<$Res> {
  factory _$PasswordEntryCopyWith(_PasswordEntry value, $Res Function(_PasswordEntry) _then) = __$PasswordEntryCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'site_name') String siteName, String username, String password, List<String> tags, String notes,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$PasswordEntryCopyWithImpl<$Res>
    implements _$PasswordEntryCopyWith<$Res> {
  __$PasswordEntryCopyWithImpl(this._self, this._then);

  final _PasswordEntry _self;
  final $Res Function(_PasswordEntry) _then;

/// Create a copy of PasswordEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? siteName = null,Object? username = null,Object? password = null,Object? tags = null,Object? notes = null,Object? createdAt = null,}) {
  return _then(_PasswordEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,siteName: null == siteName ? _self.siteName : siteName // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
