import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thrifycash/common/logic/failure.dart';
import 'package:thrifycash/common/logic/typedefs.dart';
import 'package:thrifycash/data/api/auth_api.dart';

enum AuthStateType {
  init,
  loading,
  error,
  success,
  regLoading,
  regErr,
  regSuccess,
  invalid,
  otpLoadig,
  otpError,
  otpSuccess,
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

  void login({
    required String email,
    required String password,
  }) async {
    state = const AuthState(state: AuthStateType.loading, res: null);
    final authAPI = ref.read(authAPIProvider);
    final res = await authAPI.loginWithEmail(
      email: email,
      password: password,
    );
    res.fold((l) {
      state = AuthState(state: AuthStateType.error, res: l.message);
    }, (r) {
      state = const AuthState(state: AuthStateType.success, res: null);
    });
  }

  FutureEitherVoid logout() async {
    final authAPI = ref.read(authAPIProvider);
    final res = await authAPI.logout();
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
