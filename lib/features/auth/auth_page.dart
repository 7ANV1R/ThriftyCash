import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thrifycash/common/ui/gap_helper.dart';
import 'package:thrifycash/common/ui/ui_utils.dart';
import '../../common/component/filled_btn.dart';
import '../../common/ui/color_helper.dart';
import 'controller/auth_state_controller.dart';
import 'widgets/auth_page_top_part.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: generateLighterColor(context.scheme.primary, 0.15),
        body: const Column(
          children: [
            // top part [logo, background]
            AuthPageTopPart(),

            // bottom part [form]
            AuthPageBottomPart(),
          ],
        ));
  }
}

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
    final isLoading = useState(false);
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
                'Get Started',
                style: context.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            kGapSpaceM,
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
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
            ColoredFillBtn(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // submit email
                  ref.read(authControllerProvider.notifier).submitEmail(
                        email: emailController.text,
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
          ],
        ),
      ),
    );
  }
}
