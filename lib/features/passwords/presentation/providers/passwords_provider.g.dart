// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passwords_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passwordsNotifierHash();

  @$internal
  @override
  PasswordsNotifier create() => PasswordsNotifier();
}

String _$passwordsNotifierHash() => r'62d5f8033f4dc56d63e4a21287556af583ccaa9f';

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
