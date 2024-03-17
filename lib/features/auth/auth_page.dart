import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/ui/color_helper.dart';
import '../../common/ui/ui_utils.dart';
import 'widgets/auth_page_bottom_part.dart';
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
