// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_setup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PinNotifier)
final pinProvider = PinNotifierFamily._();

final class PinNotifierProvider
    extends $NotifierProvider<PinNotifier, PinState> {
  PinNotifierProvider._({
    required PinNotifierFamily super.from,
    required PinStrategy super.argument,
  }) : super(
         retry: null,
         name: r'pinProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pinNotifierHash();

  @override
  String toString() {
    return r'pinProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PinNotifier create() => PinNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PinState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PinState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PinNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pinNotifierHash() => r'e636a2bc58bed4af37469783d133feac113a6491';

final class PinNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PinNotifier,
          PinState,
          PinState,
          PinState,
          PinStrategy
        > {
  PinNotifierFamily._()
    : super(
        retry: null,
        name: r'pinProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PinNotifierProvider call(PinStrategy strategy) =>
      PinNotifierProvider._(argument: strategy, from: this);

  @override
  String toString() => r'pinProvider';
}

abstract class _$PinNotifier extends $Notifier<PinState> {
  late final _$args = ref.$arg as PinStrategy;
  PinStrategy get strategy => _$args;

  PinState build(PinStrategy strategy);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PinState, PinState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PinState, PinState>,
              PinState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
