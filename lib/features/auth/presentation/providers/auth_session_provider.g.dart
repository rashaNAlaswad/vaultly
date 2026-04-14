// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthSession)
final authSessionProvider = AuthSessionProvider._();

final class AuthSessionProvider
    extends $AsyncNotifierProvider<AuthSession, AuthSessionData> {
  AuthSessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authSessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authSessionHash();

  @$internal
  @override
  AuthSession create() => AuthSession();
}

String _$authSessionHash() => r'813058cfdd012c5b77032c0d45ce818a15c67035';

abstract class _$AuthSession extends $AsyncNotifier<AuthSessionData> {
  FutureOr<AuthSessionData> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AuthSessionData>, AuthSessionData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AuthSessionData>, AuthSessionData>,
              AsyncValue<AuthSessionData>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
