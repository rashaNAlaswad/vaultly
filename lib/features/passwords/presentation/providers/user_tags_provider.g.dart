// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tags_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

@ProviderFor(UserTagsNotifier)
final userTagsProvider = UserTagsNotifierProvider._();

final class UserTagsNotifierProvider
    extends $AsyncNotifierProvider<UserTagsNotifier, List<String>> {
  UserTagsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userTagsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userTagsNotifierHash();

  @$internal
  @override
  UserTagsNotifier create() => UserTagsNotifier();
}

String _$userTagsNotifierHash() => r'6560588cf761f603f972889fccb44da8ec23a4ac';

abstract class _$UserTagsNotifier extends $AsyncNotifier<List<String>> {
  FutureOr<List<String>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<String>>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<String>>, List<String>>,
              AsyncValue<List<String>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
