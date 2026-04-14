// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(passwordRepository)
final passwordRepositoryProvider = PasswordRepositoryProvider._();

final class PasswordRepositoryProvider
    extends
        $FunctionalProvider<
          PasswordRepository,
          PasswordRepository,
          PasswordRepository
        >
    with $Provider<PasswordRepository> {
  PasswordRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passwordRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passwordRepositoryHash();

  @$internal
  @override
  $ProviderElement<PasswordRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PasswordRepository create(Ref ref) {
    return passwordRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PasswordRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PasswordRepository>(value),
    );
  }
}

String _$passwordRepositoryHash() =>
    r'0483adcb5ddc342f74eea291c6b86231997aa69e';

@ProviderFor(userTagsRepository)
final userTagsRepositoryProvider = UserTagsRepositoryProvider._();

final class UserTagsRepositoryProvider
    extends
        $FunctionalProvider<
          UserTagsRepository,
          UserTagsRepository,
          UserTagsRepository
        >
    with $Provider<UserTagsRepository> {
  UserTagsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userTagsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userTagsRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserTagsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserTagsRepository create(Ref ref) {
    return userTagsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserTagsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserTagsRepository>(value),
    );
  }
}

String _$userTagsRepositoryHash() =>
    r'81fcdc0612a824afdb72926630b19ed239f14152';
