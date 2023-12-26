import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../common/component/loader.dart';
import '../../data/api/auth_api.dart';
// import '../../data/services/shared_pref_services.dart';
import '../db_download/db_download_page.dart';
import '../nav_bar/main_layout_page.dart';

import 'login_view.dart';

final isDataDownloadedProvider = StateProvider<bool>((ref) {
  // final status = SharedPrefServices().getDownloadStatus();
  // if (status != null) {
  return true;
  // }
  // return false;
});

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authUserStateProvider);
    // final downloadStatus = ref.watch(isDataDownloadedProvider);
    const downloadStatus = true;

    return switch (authState) {
      AsyncData(:final value) => value == null
          ? const LoginPage()
          : downloadStatus
              ? MainLayoutPage(
                  user: value,
                )
              // ignore: dead_code
              : const DbDownloadPage(),
      AsyncError() => const Scaffold(body: Text('Oops, something unexpected happened')),
      _ => const LoaderPage(),
    };
  }
}
