// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_session_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthSessionData {

 String? get userId; bool get hasPin; bool get isUnlocked;
/// Create a copy of AuthSessionData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSessionDataCopyWith<AuthSessionData> get copyWith => _$AuthSessionDataCopyWithImpl<AuthSessionData>(this as AuthSessionData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSessionData&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.hasPin, hasPin) || other.hasPin == hasPin)&&(identical(other.isUnlocked, isUnlocked) || other.isUnlocked == isUnlocked));
}


@override
int get hashCode => Object.hash(runtimeType,userId,hasPin,isUnlocked);

@override
String toString() {
  return 'AuthSessionData(userId: $userId, hasPin: $hasPin, isUnlocked: $isUnlocked)';
}


}

/// @nodoc
abstract mixin class $AuthSessionDataCopyWith<$Res>  {
  factory $AuthSessionDataCopyWith(AuthSessionData value, $Res Function(AuthSessionData) _then) = _$AuthSessionDataCopyWithImpl;
@useResult
$Res call({
 String? userId, bool hasPin, bool isUnlocked
});




}
/// @nodoc
class _$AuthSessionDataCopyWithImpl<$Res>
    implements $AuthSessionDataCopyWith<$Res> {
  _$AuthSessionDataCopyWithImpl(this._self, this._then);

  final AuthSessionData _self;
  final $Res Function(AuthSessionData) _then;

/// Create a copy of AuthSessionData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = freezed,Object? hasPin = null,Object? isUnlocked = null,}) {
  return _then(_self.copyWith(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,hasPin: null == hasPin ? _self.hasPin : hasPin // ignore: cast_nullable_to_non_nullable
as bool,isUnlocked: null == isUnlocked ? _self.isUnlocked : isUnlocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthSessionData].
extension AuthSessionDataPatterns on AuthSessionData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthSessionData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthSessionData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthSessionData value)  $default,){
final _that = this;
switch (_that) {
case _AuthSessionData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthSessionData value)?  $default,){
final _that = this;
switch (_that) {
case _AuthSessionData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? userId,  bool hasPin,  bool isUnlocked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthSessionData() when $default != null:
return $default(_that.userId,_that.hasPin,_that.isUnlocked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? userId,  bool hasPin,  bool isUnlocked)  $default,) {final _that = this;
switch (_that) {
case _AuthSessionData():
return $default(_that.userId,_that.hasPin,_that.isUnlocked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? userId,  bool hasPin,  bool isUnlocked)?  $default,) {final _that = this;
switch (_that) {
case _AuthSessionData() when $default != null:
return $default(_that.userId,_that.hasPin,_that.isUnlocked);case _:
  return null;

}
}

}

/// @nodoc


class _AuthSessionData implements AuthSessionData {
  const _AuthSessionData({this.userId, this.hasPin = false, this.isUnlocked = false});
  

@override final  String? userId;
@override@JsonKey() final  bool hasPin;
@override@JsonKey() final  bool isUnlocked;

/// Create a copy of AuthSessionData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthSessionDataCopyWith<_AuthSessionData> get copyWith => __$AuthSessionDataCopyWithImpl<_AuthSessionData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthSessionData&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.hasPin, hasPin) || other.hasPin == hasPin)&&(identical(other.isUnlocked, isUnlocked) || other.isUnlocked == isUnlocked));
}


@override
int get hashCode => Object.hash(runtimeType,userId,hasPin,isUnlocked);

@override
String toString() {
  return 'AuthSessionData(userId: $userId, hasPin: $hasPin, isUnlocked: $isUnlocked)';
}


}

/// @nodoc
abstract mixin class _$AuthSessionDataCopyWith<$Res> implements $AuthSessionDataCopyWith<$Res> {
  factory _$AuthSessionDataCopyWith(_AuthSessionData value, $Res Function(_AuthSessionData) _then) = __$AuthSessionDataCopyWithImpl;
@override @useResult
$Res call({
 String? userId, bool hasPin, bool isUnlocked
});




}
/// @nodoc
class __$AuthSessionDataCopyWithImpl<$Res>
    implements _$AuthSessionDataCopyWith<$Res> {
  __$AuthSessionDataCopyWithImpl(this._self, this._then);

  final _AuthSessionData _self;
  final $Res Function(_AuthSessionData) _then;

/// Create a copy of AuthSessionData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,Object? hasPin = null,Object? isUnlocked = null,}) {
  return _then(_AuthSessionData(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,hasPin: null == hasPin ? _self.hasPin : hasPin // ignore: cast_nullable_to_non_nullable
as bool,isUnlocked: null == isUnlocked ? _self.isUnlocked : isUnlocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
