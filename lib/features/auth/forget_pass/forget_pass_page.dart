import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/component/filled_btn.dart';
import '../../../common/component/snackbar.dart';
import '../../../common/ui/gap_helper.dart';
import '../../../common/ui/ui_utils.dart';
import '../../../common/ui/validator.dart';
import '../../../const/asset_const.dart';
import '../../../router/app_route.dart';
import '../widgets/auth_input_box.dart';
import 'controller/forget_pass_controller.dart';

class ForgetPassPage extends StatefulHookConsumerWidget {
  const ForgetPassPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends ConsumerState<ForgetPassPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isLoading = useState<bool>(false);
    final emailController = useTextEditingController();

    // listener
    ref.listen(
      fpControllerProvider,
      (previous, next) async {
        if (next.state == FPStateType.submitEmailLoading) {
          isLoading.value = true;
        }
        if (next.state == FPStateType.submitEmailError) {
          isLoading.value = false;

          showErrorSnackbar(context: context, message: next.res, title: 'Error');
        }
        if (next.state == FPStateType.submitEmailSuccess) {
          isLoading.value = false;
          // navigate to otp page
          context.push(ScreenPaths.verifyResetPassOTP, extra: next.res);
        }
      },
    );
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AssetConstants.forgotPass,
                height: context.screenSize.height * 0.25,
              ),
              Text(
                'Forgot password?',
                style: context.textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              kGapSpaceXS,
              Text(
                "No worries, we've got you covered. Enter your email address and we'll send you a OTP to reset your password.",
                style: context.textTheme.labelMedium!.copyWith(
                  color: context.scheme.outline,
                ),
              ),
              kGapSpaceXXL,
              AuthInputBox(
                controller: emailController,
                label: 'Email',
                prefixIcon: Icons.email,
                validator: emailValidator,
              ),
              kGapSpaceL,
              ColoredFillBtn(
                width: double.infinity,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // submit email
                    ref.read(fpControllerProvider.notifier).resetPass(emailController.text);
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
            ],
          ),
        ),
      ),
    );
  }
}
