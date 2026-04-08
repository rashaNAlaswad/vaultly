import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/add_password/presentation/screens/add_password_screen.dart';
import '../../features/auth/presentation/email/screens/email_entry_screen.dart';
import '../../features/auth/presentation/otp/screens/otp_verification_screen.dart';
import '../../features/auth/presentation/pin_setup/screens/pin_setup_screen.dart';
import '../../features/auth/presentation/pin_setup/strategies/pin_entry_strategy.dart';
import '../../features/auth/presentation/pin_setup/strategies/pin_setup_strategy.dart';
import '../../features/home/presentation/screens/home_screen.dart';
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
        path: AppRoutes.pinSetup,
        builder: (context, state) =>
            const PinScreen(strategy: PinSetupStrategy()),
      ),
      GoRoute(
        path: AppRoutes.pinEntry,
        builder: (context, state) =>
            const PinScreen(strategy: PinEntryStrategy()),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.addPassword,
        builder: (context, state) => const AddPasswordScreen(),
      ),
    ],
    errorBuilder: (context, state) =>
        NotFoundScreen(routeName: state.uri.toString()),
  );
}
