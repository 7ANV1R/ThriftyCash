import 'package:go_router/go_router.dart';
import 'package:thrifycash/features/auth/auth_view.dart';

class ScreenPaths {
  static String splash = '/';
  static String intro = '/welcome';
  static String home = '/home';
  static String login = '/login';
}

final appRouter = GoRouter(
  initialLocation: ScreenPaths.login,
  routes: [
    GoRoute(
      path: ScreenPaths.login,
      builder: (context, state) {
        return const LoginPage();
      },
    ),
  ],
);
