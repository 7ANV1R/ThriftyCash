import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:thrifycash/features/db_download/db_download.dart';

import '../../common/component/loader.dart';
import '../../data/api/auth_api.dart';
import '../../data/services/shared_pref_services.dart';
import '../home/homepage.dart';
import 'authentication_page.dart';

// this will tell user logged in or not
final authUserStateProvider = StreamProvider<AuthState>((ref) async* {
  final authStream = ref.read(authAPIProvider).authState;

  await for (final authState in authStream) {
    yield authState;
  }
});

class AuthRoot extends ConsumerWidget {
  const AuthRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authUserStateProvider);
    final downloadStatus = SharedPrefServices().getDownloadStatus();

    return switch (authState) {
      AsyncData(:final value) => value.session?.user == null
          ? const AuthenticationPage()
          : downloadStatus == null
              ? DBDownloadCorePage(
                  user: value.session!.user,
                )
              : const HomePage(),
      AsyncError() => const Scaffold(body: Text('Oops, something unexpected happened')),
      _ => const LoaderPage(),
    };
  }
}
