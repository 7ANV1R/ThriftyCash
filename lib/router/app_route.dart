import 'package:go_router/go_router.dart';
import 'package:thrifycash/features/auth/auth_root.dart';

import '../features/auth/verify_page.dart';

class ScreenPaths {
  static String splash = '/';

  static String auth = '/auth';
  static String verifyOTP = '/verify-otp';
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
      path: ScreenPaths.verifyOTP,
      builder: (context, state) {
        final payload = state.extra as String;
        return VerifyOTPPage(payload: payload);
      },
    ),
  ],
);
