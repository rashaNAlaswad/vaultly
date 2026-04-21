// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'f62ab297b398ab67b94a2c6d28cd41ffe7077cc2';

@ProviderFor(biometricRepository)
final biometricRepositoryProvider = BiometricRepositoryProvider._();

final class BiometricRepositoryProvider
    extends
        $FunctionalProvider<
          BiometricRepository,
          BiometricRepository,
          BiometricRepository
        >
    with $Provider<BiometricRepository> {
  BiometricRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'biometricRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$biometricRepositoryHash();

  @$internal
  @override
  $ProviderElement<BiometricRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BiometricRepository create(Ref ref) {
    return biometricRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BiometricRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BiometricRepository>(value),
    );
  }
}

String _$biometricRepositoryHash() =>
    r'281c0548639d347ac336885bb30a8830da4d4ea1';
