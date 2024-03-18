import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../common/ui/gap_helper.dart';
import '../../common/ui/ui_utils.dart';
import '../../const/asset_const.dart';
import 'widgets/signup_part.dart';
import 'widgets/login_part.dart';

class AuthenticationPage extends HookConsumerWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoginPageShowing = useState<bool>(true);
    return Scaffold(
      backgroundColor: context.scheme.primary,
      body: Column(
        children: [
          // top part [logo, background]
          Container(
            color: context.scheme.primary,
            height: context.screenSize.height * 0.3,
            child: Center(
              child: Image.asset(
                AssetConstants.logoWhite,
                height: context.screenSize.height * 0.2,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: context.scheme.onPrimary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    kGapSpaceXXL,
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Welcome to\n',
                        style: context.textTheme.titleMedium!.copyWith(
                          color: context.scheme.primary,
                        ),
                        children: [
                          TextSpan(
                            text: 'ThrifyCash',
                            style: context.textTheme.headlineMedium!.copyWith(
                              color: context.scheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    kGapSpaceXXL,
                    RepaintBoundary(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: isLoginPageShowing.value
                            ? LoginPart(
                                isLoginPageShowing: isLoginPageShowing,
                              )
                                .animate(
                                  target: isLoginPageShowing.value ? 1 : 0,
                                  onPlay: (controller) => controller.reverse(),
                                )
                                .slide(begin: const Offset(-1.5, 0), end: Offset.zero)
                            : SignUpPart(
                                isLoginPageShowing: isLoginPageShowing,
                              )
                                .animate(
                                  target: isLoginPageShowing.value ? 1 : 0,
                                )
                                .slide(
                                  end: const Offset(1.5, 0),
                                  begin: Offset.zero,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
