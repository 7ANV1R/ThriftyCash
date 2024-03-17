import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../home/homepage.dart';

import '../../common/component/loader.dart';
import '../../data/api/auth_api.dart';
import 'auth_page.dart';

class AuthRoot extends ConsumerWidget {
  const AuthRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authUserStateProvider);

    return switch (authState) {
      //TODO: fix not updating the UI when user signed in
      /// this is happening because of the `context.push` for registration that's why `AuthPage()` is not updating to `HomePage()`
      AsyncData(:final value) => value == null ? const AuthPage() : const HomePage(),
      AsyncError() => const Scaffold(body: Text('Oops, something unexpected happened')),
      _ => const LoaderPage(),
    };
  }
}
