import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thrifycash/data/api/auth_api.dart';

class ForgetPassPage extends StatefulHookConsumerWidget {
  const ForgetPassPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends ConsumerState<ForgetPassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton(
              onPressed: () {
                // send reset link
                ref.read(authAPIProvider).resetPassword(email: 'kidafoc594@cmheia.com');
              },
              child: Text('Send Reset Link'),
            ),
            FilledButton(
              onPressed: () {
                ref.read(authAPIProvider).verifyResetPasswordOTP(
                      token: '365168',
                    );
              },
              child: Text('Verify OTP'),
            ),
            FilledButton(
              onPressed: () {
                ref.read(authAPIProvider).updatePassword(
                      newPassword: '123456',
                    );
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
