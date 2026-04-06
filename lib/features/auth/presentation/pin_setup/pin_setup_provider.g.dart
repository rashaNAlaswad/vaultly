// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_setup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PinSetup)
final pinSetupProvider = PinSetupProvider._();

final class PinSetupProvider extends $NotifierProvider<PinSetup, List<int>> {
  PinSetupProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pinSetupProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pinSetupHash();

  @$internal
  @override
  PinSetup create() => PinSetup();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<int>>(value),
    );
  }
}

String _$pinSetupHash() => r'c8a9bc624ada3a640b9bb375f26962dc6a72bfc4';

abstract class _$PinSetup extends $Notifier<List<int>> {
  List<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<int>, List<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<int>, List<int>>,
              List<int>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
