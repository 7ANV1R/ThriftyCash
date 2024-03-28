import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../common/logic/error_util.dart';
import '../../common/logic/failure.dart';
import '../../common/logic/typedefs.dart';
import '../../common/ui/logger.dart';
import '../iapi/i_auth_api.dart';
import '../local_db/db.dart';
import '../services/shared_pref_services.dart';

final authAPIProvider = Provider((ref) {
  return AuthAPI(
    supabaseClient: Supabase.instance.client,
  );
});

class AuthAPI implements IAuthAPI {
  final SupabaseClient _supabaseClient;

  AuthAPI({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  Stream<AuthState> get authState => _supabaseClient.auth.onAuthStateChange;

  @override
  FutureEither<AuthResponse> loginWithEmailPass({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      return right(response);
    } catch (e, st) {
      LoggerManager.red('AuthAPI.loginWithEmailPass $e $st');
      final err = getErrorMessage(e);
      return left(Failure(message: err, stackTrace: st));
    }
  }

  @override
  FutureEither<AuthResponse> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'fullName': fullName,
        },
      );
      return right(response);
    } catch (e, st) {
      LoggerManager.red('AuthAPI.register $e $st');
      final err = getErrorMessage(e);
      return left(Failure(message: err, stackTrace: st));
    }
  }

  @override
  FutureEitherVoid resetPassword({required String email}) async {
    try {
      await _supabaseClient.auth.resetPasswordForEmail(
        email,
      );

      return right(null);
    } catch (e, st) {
      LoggerManager.red('AuthAPI.resetPassword $e $st');
      final err = getErrorMessage(e);
      return left(Failure(message: err, stackTrace: st));
    }
  }

  @override
  FutureEither<AuthResponse> verifyResetPasswordOTP({
    required String token,
    required String payload,
  }) async {
    try {
      final response =
          await _supabaseClient.auth.verifyOTP(email: payload, token: token, type: OtpType.email);

      return right(response);
    } catch (e, st) {
      LoggerManager.red('AuthAPI.verifyResetPasswordOTP $e $st');
      final err = getErrorMessage(e);
      return left(Failure(message: err, stackTrace: st));
    }
  }

  @override
  FutureEither<UserResponse> updatePassword({required String newPassword}) async {
    try {
      final response = await _supabaseClient.auth.updateUser(
        UserAttributes(
          password: newPassword,
        ),
      );

      return right(response);
    } catch (e, st) {
      LoggerManager.red('AuthAPI.verifyResetPasswordOTP $e $st');
      final err = getErrorMessage(e);
      return left(Failure(message: err, stackTrace: st));
    }
  }

  @override
  FutureEitherVoid logout(WidgetRef ref) async {
    try {
      // /// [delete all db data]
      await SharedPrefServices().removeDownloadStatus();
      await db.writeTxn(() async => await db.clear());

      await _supabaseClient.auth.signOut();
      return right(null);
    } catch (e, st) {
      LoggerManager.red('AuthAPI.logout $e $st');
      final res = getErrorMessage(e);
      return left(Failure(message: res, stackTrace: st));
    }
  }
}
