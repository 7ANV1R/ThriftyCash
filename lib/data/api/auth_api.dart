import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../common/logic/error_util.dart';
import '../../common/logic/failure.dart';
import '../../common/logic/typedefs.dart';
import '../../common/ui/logger.dart';

final authAPIProvider = Provider((ref) {
  return AuthAPI(
    supabaseClient: Supabase.instance.client,
  );
});

// this will tell user logged in or not
final authUserStateProvider = StreamProvider<User?>((ref) async* {
  final authStream = ref.read(authAPIProvider).authState;

  await for (final authState in authStream) {
    yield authState.session?.user;
  }
});

final authStateStreamProvider = StreamProvider<AuthState>((ref) async* {
  final stream = ref.read(authAPIProvider).authState;
  await for (final authState in stream) {
    yield authState;
  }
});

abstract class IAuthAPI {
  FutureEither<AuthResponse> loginWithEmailPass({
    required String email,
    required String password,
  });

  FutureEither<AuthResponse> register({
    required String fullName,
    required String email,
    required String password,
  });

  FutureEitherVoid resetPassword({
    required String email,
  });
  FutureEither<AuthResponse> verifyResetPasswordOTP({
    required String token,
    required String payload,
  });

  FutureEither<UserResponse> updatePassword({
    required String newPassword,
  });

  FutureEitherVoid logout(WidgetRef ref);
}

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
    } on AuthException catch (e, st) {
      LoggerManager.red('AuthAPI.loginWithEmailPass $e $st');
      return left(Failure(message: e.message, stackTrace: st));
    } on Exception catch (e, st) {
      LoggerManager.red('AuthAPI.loginWithEmailPass $e $st');
      return left(Failure(message: e.toString(), stackTrace: st));
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
    } on AuthException catch (e, st) {
      LoggerManager.red('AuthAPI.register $e $st');
      return left(Failure(message: e.message, stackTrace: st));
    } on Exception catch (e, st) {
      LoggerManager.red('AuthAPI.register $e $st');
      return left(Failure(message: e.toString(), stackTrace: st));
    }
  }

  @override
  FutureEitherVoid logout(WidgetRef ref) async {
    try {
      // /// [delete all db data]
      // await SharedPrefServices().removeDownloadStatus();
      // await DatabaseServices().truncateAllData();
      // ref.read(isDataDownloadedProvider.notifier).update((state) => false);

      await _supabaseClient.auth.signOut();
      return right(null);
    } catch (e, st) {
      LoggerManager.red('AuthAPI.logout $e $st');
      final res = getErrorMessage(e);
      return left(Failure(message: res, stackTrace: st));
    }
  }

  @override
  FutureEitherVoid resetPassword({required String email}) async {
    try {
      await _supabaseClient.auth.resetPasswordForEmail(
        email,
      );

      return right(null);
    } on AuthException catch (e, st) {
      LoggerManager.red('AuthAPI.resetPassword $e $st');
      return left(Failure(message: e.message, stackTrace: st));
    } on Exception catch (e, st) {
      LoggerManager.red('AuthAPI.resetPassword $e $st');
      return left(Failure(message: e.toString(), stackTrace: st));
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
    } on AuthException catch (e, st) {
      LoggerManager.red('AuthAPI.verifyResetPasswordOTP $e $st');
      return left(Failure(message: e.message, stackTrace: st));
    } on Exception catch (e, st) {
      LoggerManager.red('AuthAPI.verifyResetPasswordOTP $e $st');
      return left(Failure(message: e.toString(), stackTrace: st));
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
    } on AuthException catch (e, st) {
      LoggerManager.red('AuthAPI.verifyResetPasswordOTP $e $st');
      return left(Failure(message: e.message, stackTrace: st));
    } on Exception catch (e, st) {
      LoggerManager.red('AuthAPI.verifyResetPasswordOTP $e $st');
      return left(Failure(message: e.toString(), stackTrace: st));
    }
  }
}
