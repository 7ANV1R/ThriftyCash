import 'package:go_router/go_router.dart';
import '../features/auth/auth_root.dart';
import '../features/auth/signup_page.dart';

class ScreenPaths {
  static String splash = '/';

  static String auth = '/auth';
  static String signUp = '/signup';
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
    GoRoute(
      path: ScreenPaths.signUp,
      builder: (context, state) {
        return const SignUpPage();
      },
    ),
  ],
);
