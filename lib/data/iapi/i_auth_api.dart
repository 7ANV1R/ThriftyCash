import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../common/logic/typedefs.dart';

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
