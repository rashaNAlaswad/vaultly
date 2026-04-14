import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/providers/auth_session_provider.dart';
import '../../features/settings/presentation/providers/settings_provider.dart';

part 'app_lifecycle_lock_provider.g.dart';

@Riverpod(keepAlive: true)
AppLifecycleListener appLifecycleLock(Ref ref) {
  final listener = AppLifecycleListener(
    onStateChange: (AppLifecycleState state) {
      if (state != AppLifecycleState.hidden) return;

      final settings = ref.read(settingsProvider).asData?.value;
      if (settings == null || !settings.lockOnBackground) return;

      ref.read(authSessionProvider.notifier).lock();
    },
  );

  ref.onDispose(listener.dispose);

  return listener;
}
