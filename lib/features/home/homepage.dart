import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:thrifycash/common/component/filled_btn.dart';
import 'package:thrifycash/common/component/snackbar.dart';
import 'package:thrifycash/common/ui/gap_helper.dart';

import '../auth/controller/auth_controller.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Homepage with email: ${user.email}'),
              kGapSpaceL,
              ColoredFillBtn(
                onPressed: () async {
                  isLoading.value = true;
                  final res = await ref.read(authControllerProvider.notifier).logout();
                  res.fold((l) {
                    if (context.mounted) {
                      isLoading.value = false;
                      showErrorSnackbar(context: context, message: l.message, title: 'Logout error');
                    }
                  }, (r) {
                    if (context.mounted) {
                      isLoading.value = false;
                    }
                  });
                },
                label: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
