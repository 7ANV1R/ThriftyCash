import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/logic/failure.dart';
import '../../../common/logic/typedefs.dart';
import '../../../data/api/auth_api.dart';

enum AuthStateType {
  init,
  loginLoading,
  loginError,
  loginSuccess,
  regLoading,
  regError,
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

  void loginWithEmailPass({
    required String email,
    required String password,
  }) async {
    state = const AuthState(state: AuthStateType.loginLoading, res: null);
    final authAPI = ref.read(authAPIProvider);
    final res = await authAPI.loginWithEmailPass(
      email: email,
      password: password,
    );
    res.fold((l) {
      state = AuthState(state: AuthStateType.loginError, res: l.message);
    }, (r) {
      state = const AuthState(state: AuthStateType.loginSuccess, res: null);
    });
  }

  void register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    state = const AuthState(state: AuthStateType.regLoading, res: null);
    final authAPI = ref.read(authAPIProvider);
    final res = await authAPI.register(
      fullName: fullName,
      email: email,
      password: password,
    );
    res.fold((l) {
      state = AuthState(state: AuthStateType.regError, res: l.message);
    }, (r) {
      state = const AuthState(state: AuthStateType.regSuccess, res: null);
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
    return left(
      const Failure(
        message: 'Logout failed',
      ),
    );
  }
}
