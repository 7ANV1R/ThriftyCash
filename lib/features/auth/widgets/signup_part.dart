import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thrifycash/common/ui/validator.dart';

import '../../../common/component/filled_btn.dart';
import '../../../common/component/snackbar.dart';
import '../../../common/ui/gap_helper.dart';
import '../../../common/ui/ui_utils.dart';
import '../controller/auth_state_controller.dart';
import 'auth_input_box.dart';

class SignUpPart extends StatefulHookConsumerWidget {
  const SignUpPart({
    super.key,
    required this.isLoginPageShowing,
  });
  final ValueNotifier<bool> isLoginPageShowing;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPartState();
}

class _SignUpPartState extends ConsumerState<SignUpPart> {
  // form key
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isLoading = useState(false);

    // listener
    ref.listen(
      authControllerProvider,
      (previous, next) async {
        if (next.state == AuthStateType.regLoading) {
          isLoading.value = true;
        }
        if (next.state == AuthStateType.regError) {
          isLoading.value = false;

          showErrorSnackbar(context: context, message: next.res, title: 'Error');
        }
        if (next.state == AuthStateType.regSuccess) {
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
            "Create your ThriftyCash account.",
            style: context.textTheme.titleMedium!.copyWith(
              color: context.scheme.outline,
            ),
          ),
          kGapSpaceM,
          AuthInputBox(
            controller: nameController,
            prefixIcon: Icons.person_pin_rounded,
            label: 'Name',
            validator: (value) {
              emptyValidator(value, 'Name');
              return null;
            },
          ),
          kGapSpaceM,
          AuthInputBox(
            controller: emailController,
            prefixIcon: Icons.mail,
            label: 'Email',
            validator: emailValidator,
          ),
          kGapSpaceM,
          AuthInputBox(
            controller: passwordController,
            prefixIcon: Icons.lock,
            label: 'Password',
            obscureText: true,
            validator: passwordValidator,
          ),
          kGapSpaceM,
          ColoredFillBtn(
            width: double.infinity,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // submit email
                ref.read(authControllerProvider.notifier).register(
                      fullName: nameController.text,
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
          Align(
            child: RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: context.textTheme.labelMedium!.copyWith(
                  color: context.scheme.outline,
                ),
                children: [
                  // textbtn
                  TextSpan(
                    text: 'Login',
                    style: context.textTheme.labelLarge!.copyWith(
                      color: context.scheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    // onTap
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        widget.isLoginPageShowing.value = true;
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
