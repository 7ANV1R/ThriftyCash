import 'package:go_router/go_router.dart';
import '../features/auth/auth_root.dart';

class ScreenPaths {
  static String splash = '/';

  static String auth = '/auth';
}

final appRouter = GoRouter(
  initialLocation: ScreenPaths.auth,
  routes: [
    GoRoute(
      path: ScreenPaths.auth,
      builder: (context, state) {
        return const AuthRoot();
      },
    ),
  ],
);
