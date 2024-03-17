import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../common/ui/ui_utils.dart';

import '../../../common/component/filled_btn.dart';
import '../../../common/component/snackbar.dart';
import '../../../common/ui/gap_helper.dart';
import '../../../router/app_route.dart';
import '../controller/auth_state_controller.dart';
import 'auth_input_box.dart';

class AuthPageBottomPart extends StatefulHookConsumerWidget {
  const AuthPageBottomPart({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthPageBottomPartState();
}

class _AuthPageBottomPartState extends ConsumerState<AuthPageBottomPart> {
  // form key
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isLoading = useState(false);

    // listener
    ref.listen(
      authControllerProvider,
      (previous, next) async {
        if (next.state == AuthStateType.loginLoading) {
          isLoading.value = true;
        }
        if (next.state == AuthStateType.loginError) {
          isLoading.value = false;

          showErrorSnackbar(context: context, message: next.res, title: 'Error');
        }
        if (next.state == AuthStateType.loginSuccess) {
          isLoading.value = false;
          // navigate to db download page
        }
      },
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.scheme.background,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              child: Text(
                'Login',
                style: context.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            kGapSpaceM,
            AuthInputBox(
              controller: emailController,
              prefixIcon: Icons.mail,
              label: 'Email',
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            kGapSpaceM,
            AuthInputBox(
              controller: passwordController,
              prefixIcon: Icons.lock,
              label: 'Password',
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password cannot be empty';
                }
                return null;
              },
            ),
            kGapSpaceM,
            ColoredFillBtn(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // submit email
                  ref.read(authControllerProvider.notifier).loginWithEmailPass(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                }
              },
              isLoading: isLoading.value,
              label: Text(
                'Continue',
                style: context.textTheme.labelLarge!.copyWith(
                  color: context.scheme.onPrimary,
                ),
              ),
            ),
            kGapSpaceM,
            TextButton(
              onPressed: () {
                context.push(ScreenPaths.signUp);
              },
              child: Text(
                'Create an account',
                style: context.textTheme.labelLarge!.copyWith(
                  color: context.scheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
