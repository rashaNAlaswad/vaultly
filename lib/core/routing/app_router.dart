import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/email/screens/email_entry_screen.dart';
import '../../features/auth/presentation/otp/screens/otp_verification_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/add_password/presentation/screens/add_password_screen.dart';
import '../../features/auth/presentation/pin_setup/screens/pin_setup_screen.dart';
import '../screens/not_found_screen.dart';
import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.pinSetup,
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
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.addPassword,
        builder: (context, state) => const AddPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.pinSetup,
        builder: (context, state) => const PinSetupScreen(),
      ),
    ],
    errorBuilder: (context, state) =>
        NotFoundScreen(routeName: state.uri.toString()),
  );
}
