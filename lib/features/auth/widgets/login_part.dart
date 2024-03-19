import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thrifycash/router/app_route.dart';

import '../../../common/component/filled_btn.dart';
import '../../../common/component/snackbar.dart';
import '../../../common/ui/gap_helper.dart';
import '../../../common/ui/ui_utils.dart';
import '../controller/auth_state_controller.dart';
import 'auth_input_box.dart';

class LoginPart extends StatefulHookConsumerWidget {
  const LoginPart({
    super.key,
    required this.isLoginPageShowing,
  });
  final ValueNotifier<bool> isLoginPageShowing;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPartState();
}

class _LoginPartState extends ConsumerState<LoginPart> {
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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Let's log you in",
            style: context.textTheme.titleMedium!.copyWith(
              color: context.scheme.outline,
            ),
          ),
          kGapSpaceM,
          AuthInputBox(
            controller: emailController,
            label: 'Email',
            prefixIcon: Icons.email,
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
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                context.push(ScreenPaths.forgetPassPage);
              },
              child: Text(
                'Forgot password?',
                style: context.textTheme.labelMedium!.copyWith(
                  color: context.scheme.primary,
                ),
              ),
            ),
          ),
          ColoredFillBtn(
            width: double.infinity,
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
          Center(
            child: TextButton(
              onPressed: () {
                widget.isLoginPageShowing.value = false;
              },
              child: Text(
                'Create an account',
                style: context.textTheme.labelLarge!.copyWith(
                  color: context.scheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
