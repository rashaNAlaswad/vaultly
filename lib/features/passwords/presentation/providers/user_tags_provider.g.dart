// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tags_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
