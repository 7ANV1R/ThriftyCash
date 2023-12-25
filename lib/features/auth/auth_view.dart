import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thrifycash/common/component/loader.dart';
import 'package:thrifycash/data/api/auth_api.dart';
import 'package:thrifycash/features/nav_bar/main_layout_page.dart';

import 'login_view.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authUserStateProvider);
    return switch (authState) {
      AsyncData(:final value) => value == null
          ? const LoginPage()
          : MainLayoutPage(
              user: value,
            ),
      AsyncError() => const Scaffold(body: Text('Oops, something unexpected happened')),
      _ => const LoaderPage(),
    };
  }
}
