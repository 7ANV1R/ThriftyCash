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

class UpdatePasswordPage extends StatefulHookConsumerWidget {
  const UpdatePasswordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends ConsumerState<UpdatePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final isLoading = useState<bool>(false);
    final passwordController = useTextEditingController();

    // listener
    ref.listen(
      fpControllerProvider,
      (previous, next) async {
        if (next.state == FPStateType.updatePassLoading) {
          isLoading.value = true;
        }
        if (next.state == FPStateType.updatePassError) {
          isLoading.value = false;

          showErrorSnackbar(context: context, message: next.res, title: 'Error');
        }
        if (next.state == FPStateType.updatePassSuccess) {
          isLoading.value = false;
          context.go(ScreenPaths.auth);
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
                AssetConstants.newPass,
                height: context.screenSize.height * 0.25,
              ),
              kGapSpaceL,
              Text(
                'Update Password',
                style: context.textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              kGapSpaceXS,
              Text(
                "Enter your new password and confirm it to update your password.",
                style: context.textTheme.labelMedium!.copyWith(
                  color: context.scheme.outline,
                ),
              ),
              kGapSpaceXXL,
              AuthInputBox(
                controller: passwordController,
                label: 'Password',
                prefixIcon: Icons.password,
                obscureText: true,
                validator: passwordValidator,
              ),
              kGapSpaceM,
              AuthInputBox(
                label: 'Confirm Password',
                prefixIcon: Icons.password,
                obscureText: true,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != passwordController.text) {
                    return 'Password does not match';
                  }
                  return null;
                },
              ),
              kGapSpaceM,
              ColoredFillBtn(
                width: double.infinity,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // update password
                    ref.read(fpControllerProvider.notifier).updatePass(
                          passwordController.text,
                        );
                  }
                },
                isLoading: isLoading.value,
                label: Text(
                  'Submit',
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
