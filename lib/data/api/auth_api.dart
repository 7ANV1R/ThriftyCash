import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../common/logic/error_util.dart';
import '../../common/logic/failure.dart';
import '../../common/logic/typedefs.dart';
import '../../common/ui/logger.dart';
import '../../features/auth/auth_view.dart';
import '../services/local_db_services.dart';
import '../services/shared_pref_services.dart';

final authAPIProvider = Provider((ref) {
  return AuthAPI(
    supabaseClient: Supabase.instance.client,
  );
});

final authUserStateProvider = StreamProvider<User?>((ref) async* {
  final authStream = ref.read(authAPIProvider).authState;

  await for (final authState in authStream) {
    yield authState.session?.user;
  }
});

abstract class IAuthAPI {
  FutureEither<AuthResponse> loginWithEmail({
    required String email,
    required String password,
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
  FutureEither<AuthResponse> loginWithEmail({required String email, required String password}) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      return right(response);
    } on AuthException catch (e, st) {
      LoggerManager.red('AuthAPI.loginWithEmail $e $st');
      return left(Failure(message: e.message, stackTrace: st));
    }
  }

  @override
  FutureEitherVoid logout(WidgetRef ref) async {
    try {
      /// [delete all db data]
      await SharedPrefServices().removeDownloadStatus();
      await DatabaseServices().truncateAllData();
      ref.read(isDataDownloadedProvider.notifier).update((state) => false);

      await _supabaseClient.auth.signOut();
      return right(null);
    } catch (e, st) {
      LoggerManager.red('AuthAPI.logout $e $st');
      final res = getErrorMessage(e);
      return left(Failure(message: res, stackTrace: st));
    }
  }
}
