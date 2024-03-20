import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import '../../../common/ui/ui_utils.dart';
import '../../../const/asset_const.dart';
import 'controller/forget_pass_controller.dart';
import '../../../router/app_route.dart';

import '../../../common/component/filled_btn.dart';
import '../../../common/component/snackbar.dart';
import '../../../common/ui/gap_helper.dart';

final lastOTPProvider = StateProvider<String>((ref) {
  return '';
});

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
        color: context.scheme.primary.withAlpha(40),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    final isLoading = useState(false);

    void verifyOTP() async {
      if (controller.text.length == 6 && !isLoading.value) {
        FocusManager.instance.primaryFocus?.unfocus();
        // for clipboard
        ref.read(lastOTPProvider.notifier).update((state) => controller.text);

        // for verification
        ref.read(fpControllerProvider.notifier).verifyOTP(
              otp: controller.text,
              payload: widget.payload,
            );
      }
    }

    // listen to the state
    ref.listen(
      fpControllerProvider,
      (previous, next) async {
        if (next.state == FPStateType.otpLoading) {
          isLoading.value = true;
        }
        if (next.state == FPStateType.otpError) {
          isLoading.value = false;
          wrongPin.value = true;

          showErrorSnackbar(context: context, message: next.res, title: 'Error');
        }
        if (next.state == FPStateType.otpSuccess) {
          wrongPin.value = false;
          isLoading.value = false;
          context.pushReplacement(ScreenPaths.updateNewPassword);
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AssetConstants.otpImages,
                height: context.screenSize.height * 0.25,
              ),
              kGapSpaceM,
              Text(
                'Verification Code',
                style: context.textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'A verification code has been sent to "${widget.payload}". Please enter the code to continue.',
                style: context.textTheme.labelMedium!.copyWith(
                  color: context.scheme.outline,
                ),
              ),
              kGapSpaceXL,
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
                  onClipboardFound: (value) {
                    final lastValue = ref.read(lastOTPProvider);

                    if (value.length == 6 && lastValue != value) {
                      controller.setText(value);
                    }
                  },
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
