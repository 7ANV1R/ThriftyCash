import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/component/filled_btn.dart';
import '../../common/component/snackbar.dart';
import '../auth/controller/auth_controller.dart';

class ProfilePage extends StatefulHookConsumerWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    return Scaffold(
      body: Center(
        child: ColoredFillBtn(
          onPressed: () async {
            isLoading.value = true;
            final res = await ref.read(authControllerProvider.notifier).logout(ref);
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
      ),
    );
  }
}
