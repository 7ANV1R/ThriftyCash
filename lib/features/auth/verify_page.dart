import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:thrifycash/common/ui/color_helper.dart';

import '../../common/component/filled_btn.dart';
import '../../common/component/snackbar.dart';
import '../../common/ui/gap_helper.dart';
import '../../common/ui/ui_utils.dart';
import 'controller/auth_state_controller.dart';

class VerifyOTPPage extends StatefulHookConsumerWidget {
  const VerifyOTPPage({
    super.key,
    required this.payload,
  });
  final String payload;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends ConsumerState<VerifyOTPPage> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wrongPin = useState<bool?>(null);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: context.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.bold,
        color: wrongPin.value == null
            ? Colors.black
            : !wrongPin.value!
                ? Colors.green
                : Colors.red,
      ),
      decoration: BoxDecoration(
        color: generateLighterColor(context.scheme.primary, 0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    final isLoading = useState(false);

    void verifyOTP() async {
      if (controller.text.length == 6 && !isLoading.value) {
        FocusManager.instance.primaryFocus?.unfocus();
        ref.read(authControllerProvider.notifier).emailOTP(
              email: widget.payload,
              otp: controller.text,
            );
      }
    }

    // listen to the state
    ref.listen(
      authControllerProvider,
      (previous, next) async {
        if (next.state == AuthStateType.otpLoadig) {
          isLoading.value = true;
        }
        if (next.state == AuthStateType.otpError) {
          isLoading.value = false;
          wrongPin.value = true;

          showErrorSnackbar(context: context, message: next.res, title: 'Error');
        }
        if (next.state == AuthStateType.loginSuccess) {
          wrongPin.value = false;

          isLoading.value = false;
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            // padding: const EdgeInsets.all(32),
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.lock,
                size: 100,
                color: context.scheme.primary,
              ),
              kGapSpaceXXXL,
              Text(
                'Verification Code',
                style: context.textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'A verification code has been sent to "${widget.payload}". Please enter the code to continue.',
                style: context.textTheme.labelMedium!.copyWith(
                  color: context.scheme.onSurfaceVariant,
                ),
              ),
              kGapSpaceL,
              SizedBox(
                height: 68,
                child: Pinput(
                  autofocus: true,
                  length: 6,
                  controller: controller,
                  focusNode: focusNode,
                  // autofocus: true,
                  defaultPinTheme: defaultPinTheme,
                  onChanged: (value) {
                    wrongPin.value = null;
                  },
                  onCompleted: (pin) {
                    verifyOTP();
                  },
                  // onClipboardFound: (value) {
                  //   controller.setText(value);
                  // },

                  androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    height: 68,
                    width: 64,
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: context.scheme.primary),
                    ),
                  ),
                ),
              ),
              kGapSpaceXL,
              ColoredFillBtn(
                onPressed: () {
                  verifyOTP();
                },
                backgroundColor: context.scheme.primary,
                label: Text(
                  'Verify',
                  style: context.textTheme.labelLarge!.copyWith(
                    color: context.scheme.onPrimary,
                  ),
                ),
                isLoading: isLoading.value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
