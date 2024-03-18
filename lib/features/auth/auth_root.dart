import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/component/loader.dart';
import '../../data/api/auth_api.dart';
import '../home/homepage.dart';
import 'authentication_page.dart';

class AuthRoot extends ConsumerWidget {
  const AuthRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authUserStateProvider);

    return switch (authState) {
      AsyncData(:final value) => value == null ? const AuthenticationPage() : const HomePage(),
      AsyncError() => const Scaffold(body: Text('Oops, something unexpected happened')),
      _ => const LoaderPage(),
    };
  }
}
