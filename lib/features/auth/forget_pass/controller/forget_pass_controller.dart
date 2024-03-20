import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/api/auth_api.dart';

enum FPStateType {
  init,
  submitEmailLoading,
  submitEmailError,
  submitEmailSuccess,
  otpLoading,
  otpError,
  otpSuccess,
  updatePassLoading,
  updatePassError,
  updatePassSuccess,
}

class FPState {
  final FPStateType state;
  final String? res;

  const FPState({required this.state, required this.res});
}

final fpControllerProvider = NotifierProvider<FPController, FPState>(FPController.new);

class FPController extends Notifier<FPState> {
  @override
  FPState build() {
    return const FPState(state: FPStateType.init, res: null);
  }

  void resetPass(String email) async {
    state = const FPState(state: FPStateType.submitEmailLoading, res: null);
    final authAPI = ref.read(authAPIProvider);

    final res = await authAPI.resetPassword(
      email: email,
    );
    res.fold((l) {
      state = FPState(state: FPStateType.submitEmailError, res: l.message);
    }, (r) {
      state = FPState(state: FPStateType.submitEmailSuccess, res: email);
    });
  }

  void verifyOTP({required String otp, required String payload}) async {
    state = const FPState(state: FPStateType.otpLoading, res: null);
    final authAPI = ref.read(authAPIProvider);

    final res = await authAPI.verifyResetPasswordOTP(
      token: otp,
      payload: payload,
    );
    res.fold(
      (l) {
        state = FPState(state: FPStateType.otpError, res: l.message);
      },
      (r) {
        state = const FPState(state: FPStateType.otpSuccess, res: null);
      },
    );
  }

  void updatePass(String newPassword) async {
    state = const FPState(state: FPStateType.updatePassLoading, res: null);
    final authAPI = ref.read(authAPIProvider);

    final res = await authAPI.updatePassword(
      newPassword: newPassword,
    );
    res.fold(
      (l) {
        state = FPState(state: FPStateType.updatePassError, res: l.message);
      },
      (r) {
        state = const FPState(state: FPStateType.updatePassSuccess, res: null);
      },
    );
  }
}
