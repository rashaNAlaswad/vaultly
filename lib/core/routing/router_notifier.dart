import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/providers/auth_session_provider.dart';
import 'app_routes.dart';

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this._ref) {
    _ref.listen(authSessionProvider, (_, _) => notifyListeners());
  }

  final Ref _ref;

  String? redirect(BuildContext context, GoRouterState state) {
    final session = _ref.read(authSessionProvider);
    final currentPath = state.matchedLocation;
    final isEmailOrOtp =
        currentPath == AppRoutes.emailEntry ||
        currentPath == AppRoutes.otpVerification;

    return session.when(
      loading: () => null,
      error: (_, _) => AppRoutes.emailEntry,
      data: (data) {
        // No user → must stay on email/OTP.
        if (data.userId == null) {
          return isEmailOrOtp ? null : AppRoutes.emailEntry;
        }

        // Has user + PIN but not yet unlocked this session → PIN unlock.
        if (data.hasPin && !data.isUnlocked) {
          return currentPath == AppRoutes.pinUnlock ? null : AppRoutes.pinUnlock;
        }

        // Unlocked user on email/OTP → send home.
        if (isEmailOrOtp) return AppRoutes.home;

        return null;
      },
    );
  }
}
