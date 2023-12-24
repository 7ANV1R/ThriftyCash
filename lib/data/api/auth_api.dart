import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:thrifycash/common/logic/failure.dart';
import 'package:thrifycash/common/logic/typedefs.dart';
import 'package:thrifycash/common/ui/logger.dart';

final authAPIProvider = Provider((ref) {
  return AuthAPI(
    supabaseClient: Supabase.instance.client,
  );
});

abstract class IAuthAPI {
  FutureEither<AuthResponse> loginWithEmail({
    required String email,
    required String password,
  });
}

class AuthAPI implements IAuthAPI {
  final SupabaseClient _supabaseClient;

  AuthAPI({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  @override
  FutureEither<AuthResponse> loginWithEmail({required String email, required String password}) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      return right(response);
    } catch (e, st) {
      LoggerManager.red('AuthAPI.loginWithEmail $e $st');
      return left(Failure(message: e.toString(), stackTrace: st));
    }
  }
}
