import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thrifycash/common/ui/gap_helper.dart';
import 'package:thrifycash/const/asset_const.dart';

import '../../common/component/filled_btn.dart';
import '../../common/ui/ui_utils.dart';

class LoginPage extends StatefulHookConsumerWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  // formkey
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    final textTheme = getTextTheme(context);
    final scheme = getColorScheme(context);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  AssetConstants.logoPNG,
                  height: size.width * 0.4,
                  width: size.width * 0.4,
                  fit: BoxFit.contain,
                ),
                kGapSpaceL,
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    // regex for email validation
                    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    } else if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                kGapSpaceM,
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                kGapSpaceM,
                ColoredFillBtn(
                  onPressed: () {},
                  label: Text(
                    'Login',
                    style: textTheme.labelLarge!.copyWith(
                      color: scheme.onPrimary,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
