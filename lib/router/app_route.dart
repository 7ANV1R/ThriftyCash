import 'package:go_router/go_router.dart';
import '../features/auth/auth_root.dart';
import '../features/auth/forget_pass/forget_pass_page.dart';

class ScreenPaths {
  static String splash = '/';

  static String auth = '/auth';
  static String forgetPassPage = '/reset-password';
  static String verifyResetPassOTP = '/verify-reset-password-otp';
  static String updateNewPassword = '/update-password';
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
      path: ScreenPaths.forgetPassPage,
      builder: (context, state) {
        return const ForgetPassPage();
      },
    ),
  ],
);
