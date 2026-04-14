import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/passwords/data/models/password_entry.dart';
import '../../features/passwords/presentation/screens/password_form_screen.dart';
import '../../features/auth/presentation/email/screens/email_entry_screen.dart';
import '../../features/auth/presentation/otp/screens/otp_verification_screen.dart';
import '../../features/auth/presentation/pin_setup/screens/pin_setup_screen.dart';
import '../../features/auth/presentation/pin_setup/strategies/pin_confirm_strategy.dart';
import '../../features/auth/presentation/pin_setup/strategies/pin_create_strategy.dart';
import '../../features/auth/presentation/pin_setup/strategies/pin_unlock_strategy.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/settings/presentation/screens/change_pin_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../screens/not_found_screen.dart';
import 'app_routes.dart';
import 'router_notifier.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final notifier = RouterNotifier(ref);
  ref.onDispose(notifier.dispose);
  return GoRouter(
    refreshListenable: notifier,
    redirect: notifier.redirect,
    routes: [
      GoRoute(
        path: AppRoutes.emailEntry,
        builder: (context, state) => const EmailEntryScreen(),
      ),
      GoRoute(
        path: AppRoutes.otpVerification,
        builder: (context, state) =>
            OtpVerificationScreen(email: state.extra as String),
      ),
      GoRoute(
        path: AppRoutes.pinCreate,
        builder: (context, state) =>
            const PinScreen(strategy: PinCreateStrategy()),
      ),
      GoRoute(
        path: AppRoutes.pinConfirm,
        redirect: (context, state) =>
            state.extra is String ? null : AppRoutes.home,
        builder: (context, state) =>
            PinScreen(strategy: PinConfirmStrategy(state.extra as String)),
      ),
      GoRoute(
        path: AppRoutes.pinUnlock,
        builder: (context, state) =>
            const PinScreen(strategy: PinUnlockStrategy()),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.addPassword,
        builder: (context, state) => const PasswordFormScreen(),
      ),
      GoRoute(
        path: AppRoutes.passwordDetail,
        redirect: (context, state) =>
            state.extra is PasswordEntry ? null : AppRoutes.home,
        builder: (context, state) =>
            PasswordFormScreen(entry: state.extra as PasswordEntry),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoutes.changePin,
        builder: (context, state) => const ChangePinScreen(),
      ),
    ],
    errorBuilder: (context, state) =>
        NotFoundScreen(routeName: state.uri.toString()),
  );
}
