import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../common/component/snackbar.dart';
import '../../common/ui/logger.dart';
import '../../common/ui/ui_utils.dart';
import '../../data/isolate/db_isolate.dart';
import '../../data/services/shared_pref_services.dart';
import '../../router/app_route.dart';

import '../../common/ui/gap_helper.dart';
import 'widgets/download_img_widget.dart';

final mainThreadBulkInsertStreamProvider = StreamProvider((ref) async* {
  await for (final message in mainThredBulkInsertReceivePort) {
    yield message;
  }
});

class DBDownloadCorePage extends StatefulHookConsumerWidget {
  const DBDownloadCorePage({super.key, required this.user});
  final User user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DBDownloadCorePageState();
}

class _DBDownloadCorePageState extends ConsumerState<DBDownloadCorePage> with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return const DBDownloading();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await bulkInsertIsolate(
      user: widget.user,
    );
  }
}

class DBDownloading extends StatefulHookConsumerWidget {
  const DBDownloading({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DBDownloadingState();
}

class _DBDownloadingState extends ConsumerState<DBDownloading> {
  @override
  Widget build(BuildContext context) {
    ref.listen(mainThreadBulkInsertStreamProvider, (prev, next) async {
      LoggerManager.yellow(" Stream Isolate Message: $next");
      if (next.value == 'Done') {
        await SharedPrefServices().setDownloadStatus();

        if (context.mounted) {
          context.pushReplacement(ScreenPaths.root);
        }
      } else if (next.value == 'Err') {
        showErrorSnackbar(context: context, title: 'Err', message: 'Err');
      }
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const DownloadImageWidget(),
              Text("Welcome Aboard!",
                  style: context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
              kGapSpaceS,
              Text('We are setting up your personal space.', style: context.textTheme.bodyMedium),
              Text('This will only take a few moments.', style: context.textTheme.bodyMedium),
              kGapSpaceXXL,
              kGapSpaceXXL,
            ],
          ),
        ),
      ),
    );
  }
}
