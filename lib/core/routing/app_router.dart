import 'package:go_router/go_router.dart';

import '../screens/not_found_screen.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    // initialLocation: AppRoutes.splash,
    routes: [
      // GoRoute(
      //   path: AppRoutes.home,
      //   builder: (context, state) => const HomeScreen(),
      // ),
    ],
    errorBuilder: (context, state) =>
        NotFoundScreen(routeName: state.uri.toString()),
  );
}
