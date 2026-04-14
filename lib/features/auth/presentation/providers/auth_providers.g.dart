// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SendOtpNotifier)
final sendOtpProvider = SendOtpNotifierProvider._();

final class SendOtpNotifierProvider
    extends $NotifierProvider<SendOtpNotifier, AsyncValue<void>> {
  SendOtpNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sendOtpProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sendOtpNotifierHash();

  @$internal
  @override
  SendOtpNotifier create() => SendOtpNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$sendOtpNotifierHash() => r'e45de2173cfd7f3bf457f8c6166604a0f5e2d2a0';

abstract class _$SendOtpNotifier extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(VerifyOtpNotifier)
final verifyOtpProvider = VerifyOtpNotifierProvider._();

final class VerifyOtpNotifierProvider
    extends $NotifierProvider<VerifyOtpNotifier, AsyncValue<void>> {
  VerifyOtpNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'verifyOtpProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$verifyOtpNotifierHash();

  @$internal
  @override
  VerifyOtpNotifier create() => VerifyOtpNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$verifyOtpNotifierHash() => r'abf5368f3eea8ab4257df881e406df5f525e7354';

abstract class _$VerifyOtpNotifier extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
