// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passwords_provider.dart';

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

@ProviderFor(PasswordsNotifier)
final passwordsProvider = PasswordsNotifierProvider._();

final class PasswordsNotifierProvider
    extends $AsyncNotifierProvider<PasswordsNotifier, List<PasswordEntry>> {
  PasswordsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passwordsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passwordsNotifierHash();

  @$internal
  @override
  PasswordsNotifier create() => PasswordsNotifier();
}

String _$passwordsNotifierHash() => r'906c13e88c09c5e8aa8f1e8dac58aea3b698a43b';

abstract class _$PasswordsNotifier extends $AsyncNotifier<List<PasswordEntry>> {
  FutureOr<List<PasswordEntry>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<PasswordEntry>>, List<PasswordEntry>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<PasswordEntry>>, List<PasswordEntry>>,
              AsyncValue<List<PasswordEntry>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
