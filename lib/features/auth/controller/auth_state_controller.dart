import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../common/logic/failure.dart';
import '../../../common/logic/typedefs.dart';
import '../../../data/api/auth_api.dart';

enum AuthStateType {
  init,
  loading,
  error,
  success,
  otpLoadig,
  otpError,
  loginSuccess,
  regSuccess,
}

class AuthState {
  final AuthStateType state;
  final String? res;

  const AuthState({required this.state, required this.res});
}

final authControllerProvider = NotifierProvider<AuthController, AuthState>(AuthController.new);

class AuthController extends Notifier<AuthState> {
  @override
  AuthState build() {
    return const AuthState(state: AuthStateType.init, res: null);
  }

  void submitEmail({
    required String email,
  }) async {
    state = const AuthState(state: AuthStateType.loading, res: null);
    final authAPI = ref.read(authAPIProvider);
    final res = await authAPI.submitEmail(
      email: email,
    );
    res.fold((l) {
      state = AuthState(state: AuthStateType.error, res: l.message);
    }, (r) {
      state = AuthState(state: AuthStateType.success, res: email);
    });
  }

  void emailOTP({
    required String otp,
    required String email,
  }) async {
    state = const AuthState(state: AuthStateType.otpLoadig, res: null);
    final authAPI = ref.read(authAPIProvider);
    final res = await authAPI.submitOTP(
      otp: otp,
      email: email,
    );
    res.fold((l) {
      state = AuthState(state: AuthStateType.otpError, res: l.message);
    }, (r) {
      state = const AuthState(state: AuthStateType.loginSuccess, res: null);
    });
  }

  FutureEitherVoid logout(WidgetRef ref) async {
    final authAPI = ref.read(authAPIProvider);
    final res = await authAPI.logout(ref);
    res.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    });
    return left(const Failure(
      message: 'Logout failed',
    ));
  }
}
