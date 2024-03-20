import 'package:go_router/go_router.dart';
import '../features/auth/auth_root.dart';
import '../features/auth/forget_pass/update_pass_page.dart';
import '../features/auth/forget_pass/verify_otp_page.dart';
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
    GoRoute(
      path: ScreenPaths.verifyResetPassOTP,
      builder: (context, state) {
        final payload = state.extra as String;
        return VerifyOTPPage(
          payload: payload,
        );
      },
    ),
    GoRoute(
      path: ScreenPaths.updateNewPassword,
      builder: (context, state) {
        return const UpdatePasswordPage();
      },
    ),
  ],
);
